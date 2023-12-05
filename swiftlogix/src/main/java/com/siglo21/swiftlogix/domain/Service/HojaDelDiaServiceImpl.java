package com.siglo21.swiftlogix.domain.Service;

import com.siglo21.swiftlogix.domain.Model.EstadoHoja;
import com.siglo21.swiftlogix.domain.Model.HojaDelDia;
import com.siglo21.swiftlogix.domain.Repository.EnvioRepository;
import com.siglo21.swiftlogix.domain.Repository.EstadoHojaRepository;
import com.siglo21.swiftlogix.domain.Repository.HojaDelDiaRepository;
import com.siglo21.swiftlogix.domain.Service.Interfaz.HojaDelDiaService;
import org.springframework.scheduling.annotation.Scheduled;
import com.siglo21.swiftlogix.domain.Model.Envio;
import org.springframework.transaction.annotation.Transactional;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class HojaDelDiaServiceImpl implements HojaDelDiaService {

    private final EnvioRepository envioRepository;

    private final HojaDelDiaRepository hojaDelDiaRepository;

    private final EstadoHojaRepository estadoHojaRepository;

    public HojaDelDiaServiceImpl(EnvioRepository envioRepository, HojaDelDiaRepository hojaDelDiaRepository, EstadoHojaRepository estadoHojaRepository) {
        this.envioRepository = envioRepository;
        this.hojaDelDiaRepository = hojaDelDiaRepository;
        this.estadoHojaRepository = estadoHojaRepository;
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

    @Override
    public void cerrarHojaDelDia(Integer idHojaDelDia, List<Integer> idsEnviosEntregados) {

    }

    @Override
    public void iniciarEntrega(Integer idHojaDelDia) {

    }


}
