package com.siglo21.swiftlogix.domain.Service;

import com.siglo21.swiftlogix.application.request.CrearEnvioRequestDto;
import com.siglo21.swiftlogix.domain.Model.*;
import com.siglo21.swiftlogix.domain.Model.EstadosEnvio.Pendiente;
import com.siglo21.swiftlogix.domain.Repository.*;
import com.siglo21.swiftlogix.domain.Service.Interfaz.EnvioService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

public class DomainEnvioServiceImpl implements EnvioService {

    private final EnvioRepository envioRepository;
    private final ClienteRepository clienteRepository;

    private final EstadoEnvioRepository estadoEnvioRepository;
    private final ZonaRepository zonaRepository;

    public DomainEnvioServiceImpl(EnvioRepository envioRepository, ClienteRepository clienteRepository, EstadoEnvioRepository estadoEnvioRepository, ZonaRepository zonaRepository) {
        this.envioRepository = envioRepository;
        this.clienteRepository = clienteRepository;
        this.estadoEnvioRepository = estadoEnvioRepository;
        this.zonaRepository = zonaRepository;
    }


    @Override
    public List<Envio> getAllFiltrado(Integer idEstado, Integer idZona, Integer idCliente) {


        return envioRepository.getAllFiltrado(idEstado, idZona, idCliente);
    }

    @Override
    public Optional<Envio> getById(String envioId) {
        return envioRepository.getById(envioId);
    }

    @Override
    @Transactional
    public Optional<Envio> save(CrearEnvioRequestDto crearEnvioRequestDto) {
        Envio envio = new Envio();
        envio.setNumeroFactura(crearEnvioRequestDto.getNumeroFactura());
        Cliente cliente = clienteRepository.getById(crearEnvioRequestDto.getIdCliente()).get();
        if (cliente == null) {
            throw new RuntimeException("Cliente no encontrado");
        }
        Zona zona = zonaRepository.getById(crearEnvioRequestDto.getIdZona()).get();
        if (zona == null) {
            throw new RuntimeException("Zona no encontrada");
        }
        envio.setCliente(cliente);
        envio.setZona(zona);

        List<DetalleEnvio> detallesEnvio = crearEnvioRequestDto.getDetalleEnvio().stream().map(detalleEnvioRequestDto ->
                new DetalleEnvio(detalleEnvioRequestDto.getNombre())).toList();

        envio.setDetalleEnvio(detallesEnvio);
        //Buscamos el estado pendiente
        Pendiente pendiente = (Pendiente) estadoEnvioRepository.getById(1).get();
        CambioEstado cambioEstado = new CambioEstado(pendiente);
        envio.setCambiosEstado(List.of(cambioEstado));
        envio.setEstadoActual(pendiente);
        envio.setDireccionEnvio(crearEnvioRequestDto.getDireccionEnvio());
        envio.setEntreCalles(crearEnvioRequestDto.getEntreCalles());
        envio.setUltimosDigitosTarjeta(crearEnvioRequestDto.getUltimosDigitosTarjeta());
        return envioRepository.save(envio);
    }

    @Override
    public Optional<Envio> update(String envioId, CrearEnvioRequestDto crearEnvioRequestDto) {return Optional.empty();}
//        Envio envio = envioRepository.getById(envioId).get();
//        Cliente cliente = clienteRepository.getById(crearEnvioRequestDto.getIdCliente()).get();
//        Camion camion = camionRepository.getById(crearEnvioRequestDto.getPatenteCamion()).get();
//        Zona zona = zonaRepository.getById(crearEnvioRequestDto.getIdZona()).get();
//        envio.setCliente(cliente);
//        envio.setCamion(camion);
//        envio.setZona(zona);
//
//        List<DetalleEnvio> detallesEnvio = crearEnvioRequestDto.getDetalleEnvio().stream().map(detalleEnvioRequestDto ->
//                new DetalleEnvio(detalleEnvioRequestDto.getNombre())).toList();
//
//        envio.setDetalleEnvio(detallesEnvio);
//        envio.setDireccionEnvio(crearEnvioRequestDto.getDireccionEnvio());
//        envio.setEntreCalles(crearEnvioRequestDto.getEntreCalles());
//        envio.setUltimosDigitosTarjeta(crearEnvioRequestDto.getUltimosDigitosTarjeta());
//        return envioRepository.save(envio);
//    }
}
