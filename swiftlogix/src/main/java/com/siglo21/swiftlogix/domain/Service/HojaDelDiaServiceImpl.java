package com.siglo21.swiftlogix.domain.Service;

import com.siglo21.swiftlogix.domain.Model.EstadoEnvio;
import com.siglo21.swiftlogix.domain.Model.EstadoHoja;
import com.siglo21.swiftlogix.domain.Model.HojaDelDia;
import com.siglo21.swiftlogix.domain.Repository.EnvioRepository;
import com.siglo21.swiftlogix.domain.Repository.EstadoEnvioRepository;
import com.siglo21.swiftlogix.domain.Repository.EstadoHojaRepository;
import com.siglo21.swiftlogix.domain.Repository.HojaDelDiaRepository;
import com.siglo21.swiftlogix.domain.Service.Interfaz.HojaDelDiaService;
import org.aspectj.util.LangUtil;
import org.springframework.scheduling.annotation.Scheduled;
import com.siglo21.swiftlogix.domain.Model.Envio;
import org.springframework.transaction.annotation.Transactional;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public class HojaDelDiaServiceImpl implements HojaDelDiaService {

    private final EnvioRepository envioRepository;

    private final HojaDelDiaRepository hojaDelDiaRepository;

    private final EstadoHojaRepository estadoHojaRepository;

    private final EstadoEnvioRepository estadoEnvioRepository;

    public HojaDelDiaServiceImpl(EnvioRepository envioRepository, HojaDelDiaRepository hojaDelDiaRepository, EstadoHojaRepository estadoHojaRepository, EstadoEnvioRepository estadoEnvioRepository) {
        this.envioRepository = envioRepository;
        this.hojaDelDiaRepository = hojaDelDiaRepository;
        this.estadoHojaRepository = estadoHojaRepository;
        this.estadoEnvioRepository = estadoEnvioRepository;
    }


    @Override
    public List<HojaDelDia> getAll() {
        return hojaDelDiaRepository.getAll();
    }

    @Override
    @Scheduled(cron = "*/30 * * * * MON-THU")
    @Transactional
    //@Scheduled(cron = "0 0 16 * MON-THU ?")
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
        }

    }

    @Transactional
    @Override
    public void cerrarHojaDelDia(Integer idHojaDelDia, List<String> nroDeEnviosEntregados) {

        //Funcionalidad que debe cambiar el estado de todos los envios que se pasen como parametro a entregado que tambien pertenezcan
        //a la hoja del dia que se pasa como parametro

        //Busco la hoja del dia
        HojaDelDia hojaDelDia = hojaDelDiaRepository.getById(idHojaDelDia).get();


        //Recorrer los envios de la hoja y marcar los que esten en la lista como entregados

        //Primero buscamos los 2 posibles estados a los que puede cambiar el envio
        try {
            EstadoEnvio entregado = estadoEnvioRepository.getById(4).get();
            EstadoEnvio noEntregado = estadoEnvioRepository.getById(3).get();
            EstadoEnvio pendiente = estadoEnvioRepository.getById(1).get();


            List<Envio> enviosDeLaHoja = hojaDelDia.getEnvios();
            for (Envio envio: enviosDeLaHoja) {
                if (nroDeEnviosEntregados.contains(envio.getNumeroFactura())){
                    envio.entregado(entregado);
                }else {
                    envio.noEntregado(noEntregado);
                }
                //luego de cambiar el estado del envio, enviamos el msg pendiente para que
                // aquellos que allan pasado a noEntregado se pasen a pendiente, esto lo hacemos
                //para que quede registrado que se intento entregar el envio pero no se pudo
                // lo cual lo vemos reflejado en los cambios de estado.

                //Como la implementacion por defecto del metodo pendiente no hace nada, solo cambia el estado para aquellos
                // que tengan como estado actual noEntregado, entonces no hay problema en llamarlo para todos los envios
                // ya que los que esten en pendientes no van a hacer nada.

                envio.pendiente(pendiente);
                //guardar envios uno por uno cada vez que actualiza uno
                envioRepository.save(envio);

            }
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
    public void iniciarEntrega(Integer idHojaDelDia) {
        //Busco la hoja del dia
        HojaDelDia hojaDelDia = hojaDelDiaRepository.getById(idHojaDelDia).get();

        //Buscamos los envios de la hoja y les cambiamos el estado a en camino
        try {
            EstadoEnvio enCamino = estadoEnvioRepository.getById(2).get();
            List<Envio> enviosDeLaHoja = hojaDelDia.getEnvios();
            for (Envio envio : enviosDeLaHoja) {
                envio.enCamino(enCamino);
                //guardar envios uno por uno cada vez que actualiza uno
                envioRepository.save(envio);
            }
        }catch (Exception e){
                throw new RuntimeException("Problemas con el Envio de la Hoja Del Dia");
            }



        //Buscamos el estado
        EstadoHoja estadoHoja = estadoHojaRepository.getById(2).orElse(null);
        if (estadoHoja == null) throw new RuntimeException("Problemas con el estado de la Hoja");
        else hojaDelDia.setEstadoHojaDelDia(estadoHoja);
        //Cambiar el estado de la hoja del dia a cerrada
        //Guardar la hoja del dia

        hojaDelDiaRepository.save(hojaDelDia);
    }


}
