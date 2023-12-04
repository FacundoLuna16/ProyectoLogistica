package com.siglo21.swiftlogix.domain.Service;

import com.siglo21.swiftlogix.application.request.CrearEnvioRequestDto;
import com.siglo21.swiftlogix.domain.Model.*;
import com.siglo21.swiftlogix.domain.Model.EstadosEnvio.Pendiente;
import com.siglo21.swiftlogix.domain.Repository.CamionRepository;
import com.siglo21.swiftlogix.domain.Repository.ClienteRepository;
import com.siglo21.swiftlogix.domain.Repository.EnvioRepository;
import com.siglo21.swiftlogix.domain.Repository.ZonaRepository;
import com.siglo21.swiftlogix.domain.Service.Interfaz.EnvioService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

public class DomainEnvioServiceImpl implements EnvioService {

    private final EnvioRepository envioRepository;
    private final ClienteRepository clienteRepository;

    private final CamionRepository camionRepository;
    private final ZonaRepository zonaRepository;

    public DomainEnvioServiceImpl(EnvioRepository envioRepository, ClienteRepository clienteRepository, CamionRepository camionRepository, ZonaRepository zonaRepository) {
        this.envioRepository = envioRepository;
        this.clienteRepository = clienteRepository;
        this.camionRepository = camionRepository;
        this.zonaRepository = zonaRepository;
    }


    @Override
    public List<Envio> getAll() {
        return envioRepository.getAll();
    }

    @Override
    public Optional<Envio> getById(int envioId) {
        return envioRepository.getById(envioId);
    }

    @Override
    @Transactional
    public Optional<Envio> save(CrearEnvioRequestDto crearEnvioRequestDto) {
        Envio envio = new Envio();
        envio.setNumeroFactura(crearEnvioRequestDto.getNumeroFactura());
        Cliente cliente = clienteRepository.getById(crearEnvioRequestDto.getIdCliente()).get();
        Zona zona = zonaRepository.getById(crearEnvioRequestDto.getIdZona()).get();
        envio.setCliente(cliente);
        envio.setZona(zona);

        List<DetalleEnvio> detallesEnvio = crearEnvioRequestDto.getDetalleEnvio().stream().map(detalleEnvioRequestDto ->
                new DetalleEnvio(detalleEnvioRequestDto.getNombre())).toList();

        envio.setDetalleEnvio(detallesEnvio);
        Pendiente pendiente = new Pendiente(1, "PENDIENTE");
        CambioEstado cambioEstado = new CambioEstado(pendiente);
        envio.setCambiosEstado(List.of(cambioEstado));
        envio.setEstadoActual(pendiente);
        envio.setDireccionEnvio(crearEnvioRequestDto.getDireccionEnvio());
        envio.setEntreCalles(crearEnvioRequestDto.getEntreCalles());
        envio.setUltimosDigitosTarjeta(crearEnvioRequestDto.getUltimosDigitosTarjeta());
        return envioRepository.save(envio);
    }

    @Override
    public Optional<Envio> update(int envioId, CrearEnvioRequestDto crearEnvioRequestDto) {return Optional.empty();}
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
