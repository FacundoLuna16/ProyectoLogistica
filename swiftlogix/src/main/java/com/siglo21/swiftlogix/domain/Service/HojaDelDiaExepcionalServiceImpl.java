package com.siglo21.swiftlogix.domain.Service;

import com.siglo21.swiftlogix.domain.Model.Envio;
import com.siglo21.swiftlogix.domain.Model.EstadoHoja;
import com.siglo21.swiftlogix.domain.Model.HojaDelDiaExepcional;
import com.siglo21.swiftlogix.domain.Repository.*;
import com.siglo21.swiftlogix.domain.Service.Interfaz.HojaDelDiaExepcionalService;
import com.siglo21.swiftlogix.domain.exchangePort.WhatsappService;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;


public class HojaDelDiaExepcionalServiceImpl implements HojaDelDiaExepcionalService {


    private final EnvioRepository envioRepository;

    private final HojaDelDiaExepcionalRepository hojaDelDiaExepcionalRepository;

    private final EstadoHojaRepository estadoHojaRepository;

    private final EstadoEnvioRepository estadoEnvioRepository;

    private final CamionRepository camionRepository;

    private final RepartidorRepository repartidorRepository;

    public HojaDelDiaExepcionalServiceImpl(EnvioRepository envioRepository, HojaDelDiaExepcionalRepository hojaDelDiaExepcionalRepository, EstadoHojaRepository estadoHojaRepository, EstadoEnvioRepository estadoEnvioRepository, CamionRepository camionRepository, RepartidorRepository repartidorRepository) {
        this.envioRepository = envioRepository;
        this.hojaDelDiaExepcionalRepository = hojaDelDiaExepcionalRepository;
        this.estadoHojaRepository = estadoHojaRepository;
        this.estadoEnvioRepository = estadoEnvioRepository;
        this.camionRepository = camionRepository;
        this.repartidorRepository = repartidorRepository;
    }


    @Override
    public List<HojaDelDiaExepcional> getAll() {
        return hojaDelDiaExepcionalRepository.getAll();
    }

    @Override
    public HojaDelDiaExepcional getHojaDelDia(LocalDate fechaReparto) {
        return hojaDelDiaExepcionalRepository.getByFechaReparto(fechaReparto).orElseThrow(() -> new RuntimeException("Hoja del dia no encontrada"));
    }

    @Override
    @Transactional
    public HojaDelDiaExepcional generarHojaDelDia(List<String> idsEnvios, LocalDate fechaReparto,
                                                  String idCamion, Integer idRepartidor) {

        //validar si ya existe una hoja del dia para esa fecha

        if (hojaDelDiaExepcionalRepository.getByFechaReparto(fechaReparto).isPresent()) {
            throw new RuntimeException("Ya existe una hoja del dia para esa fecha");
        }
        HojaDelDiaExepcional hojaDelDiaExepcional = new HojaDelDiaExepcional();
        hojaDelDiaExepcional.setFechaReparto(fechaReparto);

        //Obtenemos el camion
        hojaDelDiaExepcional.setCamion(camionRepository.getById(idCamion).orElseThrow(() -> new RuntimeException("Camion no encontrado")));

        //Obtenemos el repartidor
        hojaDelDiaExepcional.setRepartidor(repartidorRepository.getById(idRepartidor).orElseThrow(() -> new RuntimeException("Repartidor no encontrado")));

        //Agregamos los envios a la hoja del dia
        try {
            List<Envio> envios = envioRepository.getByNroFacturaList(idsEnvios);
            hojaDelDiaExepcional.setEnvios(envios);
        }catch (Exception e){
            throw new RuntimeException("Error al obtener los envios");
        }

        //Cambiamos el estado de la hoja del dia a EnPreparacion
        EstadoHoja estadoHoja = estadoHojaRepository.getById(1).orElseThrow(() -> new RuntimeException("Estado de hoja no encontrado"));
        hojaDelDiaExepcional.setEstadoHojaDelDia(estadoHoja);

        //guardamos la hoja del dia
        hojaDelDiaExepcionalRepository.save(hojaDelDiaExepcional);




        return hojaDelDiaExepcional;

    }
}
