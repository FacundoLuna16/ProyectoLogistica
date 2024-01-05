package com.siglo21.swiftlogix.domain.Service;

import com.siglo21.swiftlogix.domain.Model.EstadoEnvio;
import com.siglo21.swiftlogix.domain.Model.EstadoHoja;
import com.siglo21.swiftlogix.domain.Model.HojaDelDia;
import com.siglo21.swiftlogix.domain.Repository.EnvioRepository;
import com.siglo21.swiftlogix.domain.Repository.EstadoEnvioRepository;
import com.siglo21.swiftlogix.domain.Repository.EstadoHojaRepository;
import com.siglo21.swiftlogix.domain.Repository.HojaDelDiaRepository;
import com.siglo21.swiftlogix.domain.Service.Interfaz.HojaDelDiaService;
import com.siglo21.swiftlogix.domain.exchangePort.WhatsappService;
import jakarta.persistence.EntityNotFoundException;
import java.time.temporal.TemporalAdjusters;
import org.springframework.scheduling.annotation.Scheduled;
import com.siglo21.swiftlogix.domain.Model.Envio;
import org.springframework.transaction.annotation.Transactional;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class HojaDelDiaServiceImpl implements HojaDelDiaService {

    private final EnvioRepository envioRepository;

    private final HojaDelDiaRepository hojaDelDiaRepository;

    private final EstadoHojaRepository estadoHojaRepository;

    private final EstadoEnvioRepository estadoEnvioRepository;

    private final WhatsappService whatsappService;

    public HojaDelDiaServiceImpl(EnvioRepository envioRepository, HojaDelDiaRepository hojaDelDiaRepository, EstadoHojaRepository estadoHojaRepository, EstadoEnvioRepository estadoEnvioRepository, WhatsappService whatsappService) {
        this.envioRepository = envioRepository;
        this.hojaDelDiaRepository = hojaDelDiaRepository;
        this.estadoHojaRepository = estadoHojaRepository;
        this.estadoEnvioRepository = estadoEnvioRepository;
        this.whatsappService = whatsappService;
    }


    @Override
    public List<HojaDelDia> getAll() {
        return hojaDelDiaRepository.getAll();
    }

    @Override
    //@Scheduled(cron = "*/30 * * * * MON-THU")
    @Transactional
    @Scheduled(cron = "0 0 16 * * MON-THU")
    public void generarHojaDelDia() {

        DayOfWeek diaDeLaSemana = LocalDateTime.now().getDayOfWeek();

       Integer idZona = diaDeLaSemana.getValue();
        if (idZona > 0 && idZona < 5) {

            try {
                envioRepository.getAllFiltrado(1, idZona, null);
            }
            catch (Exception e){
                System.out.println(e.getMessage());
            }

            //Buscar todos los envios pendientes de la zona correspondiente
            List<Envio> enviosPendientesPorZona = envioRepository.getAllFiltrado(1, idZona, null);
            //List<Envio> enviosPendientesPorZona = envioRepository.getAllFiltrado(1, idZona, null);

            //Crear una hoja del dia con los envios pendientes
            //Busco el estado de hoja del dia en preparacion
            EstadoHoja estadoInicial = estadoHojaRepository.getById(1).get();
            HojaDelDia hojaDelDia = new HojaDelDia(enviosPendientesPorZona,estadoInicial);

            //Guardar la hoja del dia
            hojaDelDiaRepository.save(hojaDelDia);
        }else {
            throw new RuntimeException("No se puede generar una hoja del dia en el dia de hoy");
        }

    }

    @Transactional
    @Override
    public void cerrarHojaDelDia(Integer idHojaDelDia, List<String> nroDeEnviosEntregados) {

        //Funcionalidad que debe cambiar el estado de todos los envios que se pasen como parametro a entregado que tambien pertenezcan
        //a la hoja del dia que se pasa como parametro

        //Busco la hoja del dia
        HojaDelDia hojaDelDia = hojaDelDiaRepository.getById(idHojaDelDia).get();

        if (!hojaDelDia.estaEnCamino()) throw new RuntimeException("La hoja del dia no esta en camino");


        //Recorrer los envios de la hoja y marcar los que esten en la lista como entregados

        //Primero buscamos los 2 posibles estados a los que puede cambiar el envio
        try {
            EstadoEnvio entregado = estadoEnvioRepository.getById(4).get();
            EstadoEnvio noEntregado = estadoEnvioRepository.getById(3).get();
            EstadoEnvio pendiente = estadoEnvioRepository.getById(1).get();

            for (Envio envio : hojaDelDia.getEnvios()) {
                if (nroDeEnviosEntregados.contains(envio.getNumeroFactura())){
                    envio.entregado(entregado);
                }else {
                    envio.noEntregado(noEntregado);
                }

                /*
                luego de cambiar el estado del envio, enviamos el msg pendiente para que
                 aquellos que allan pasado a noEntregado se pasen a pendiente, esto lo hacemos
                para que quede registrado que se intento entregar el envio pero no se pudo
                 lo cual lo vemos reflejado en los cambios de estado.

                Como la implementacion por defecto del metodo pendiente no hace nada, solo cambia el estado para aquellos
                 que tengan como estado actual noEntregado, entonces no hay problema en llamarlo para todos los envios
                 ya que los que esten en pendientes no van a hacer nada.
                */

                //TODO CAMBIAR PARA QUE SE HAGA AL FINAL DEL DIA el cambio a pendiente
                envio.pendiente(pendiente);
            }
            envioRepository.saveAll(hojaDelDia.getEnvios());
        }catch (Exception e){
            throw new RuntimeException("Problemas con el Envio de la Hoja Del Dia");
        }
        //Buscamos el estado
        EstadoHoja estadoHoja = estadoHojaRepository.getById(3).orElse(null);
        if (estadoHoja == null) throw new RuntimeException("Problemas con el estado de la Hoja");
        else hojaDelDia.setEstadoHojaDelDia(estadoHoja);
        //Cambiar el estado de la hoja del dia a cerrada
        //Guardar la hoja del dia

        hojaDelDiaRepository.save(hojaDelDia);

    }

    @Override
    @Transactional
    public void iniciarEntrega(Integer idHojaDelDia) {
        //Busco la hoja del dia
        HojaDelDia hojaDelDia = hojaDelDiaRepository.getById(idHojaDelDia).get();
        if (!hojaDelDia.estaEnPreparacion()) throw new RuntimeException("La hoja del dia no esta en preparacion");

        //Buscamos los envios de la hoja y les cambiamos el estado a en camino
        try {
            EstadoEnvio enCamino = estadoEnvioRepository.getById(2)
                    .orElseThrow(() -> new EntityNotFoundException("No se encontró el Estado 'En Camino'"));

            //List<Envio> enviosDeLaHoja = hojaDelDia.getEnvios();
            for (Envio envio : hojaDelDia.getEnvios()) {
                envio.enCamino(enCamino);

                String numero = envio.getCliente().getNumeroTelefono();
                String numeroFactura = envio.getNumeroFactura();
                //TODO: DESCOMENTAR ENVIO DE WHATSAPP
//                whatsappService.enviarMensaje(numero, numeroFactura, 1);
                //guardar envios uno por uno cada vez que actualiza uno
                //envioRepository.save(envio);
            }
            //guardar todos los envios juntos
            envioRepository.saveAll(hojaDelDia.getEnvios());
        }catch (EntityNotFoundException e) {
            throw new RuntimeException("No se encontró una entidad necesaria.", e);
        } catch (Exception e) {
            throw new RuntimeException("Ocurrió un error al procesar la Hoja del Día.", e);
        }

        //Buscamos el estado
        EstadoHoja estadoHoja = estadoHojaRepository.getById(2).orElse(null);
        if (estadoHoja == null) throw new RuntimeException("Problemas con el estado de la Hoja");
        else hojaDelDia.setEstadoHojaDelDia(estadoHoja);
        //Cambiar el estado de la hoja del dia a cerrada
        //Guardar la hoja del dia
        hojaDelDiaRepository.save(hojaDelDia);
    }

    @Override
    public HojaDelDia getHojaDelDia(LocalDate idHojaDelDia) {
        return hojaDelDiaRepository.getHojaDelDia(idHojaDelDia).orElseThrow(() -> new RuntimeException("No se encontró la Hoja del Día."));
    }

    @Override
    public List<HojaDelDia> getHojaDelDiaSemanal(LocalDate fechaReparto) {
        // Obtener la semana correspondiente a la fecha de reparto
        LocalDate startDate = fechaReparto.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
        LocalDate endDate = startDate.plusDays(6);  // asumiendo una semana de lunes a domingo

        // Llamar al método en el repositorio para obtener las hojas del día de esa semana
        return hojaDelDiaRepository.getHojaDelDiaBetween(startDate, endDate);
    }

    @Override
    public void enviarMensaje(List<String> numeros) {
        try {
            //recorro los numeros y envico cada uno a enviarMensaje
            for (String numero : numeros) {
                whatsappService.enviarMensaje(numero,"A-1234-12345566",1);
            }
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }


}
