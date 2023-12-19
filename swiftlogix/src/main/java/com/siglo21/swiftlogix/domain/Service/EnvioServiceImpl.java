package com.siglo21.swiftlogix.domain.Service;

import com.siglo21.swiftlogix.application.request.ActualizarEnviorRequestDto;
import com.siglo21.swiftlogix.application.request.CrearEnvioRequestDto;
import com.siglo21.swiftlogix.domain.Model.*;
import com.siglo21.swiftlogix.domain.Model.EstadosEnvio.Pendiente;
import com.siglo21.swiftlogix.domain.Repository.*;
import com.siglo21.swiftlogix.domain.Service.Interfaz.EnvioService;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

public class EnvioServiceImpl implements EnvioService {

    private final EnvioRepository envioRepository;
    private final ClienteRepository clienteRepository;

    private final EstadoEnvioRepository estadoEnvioRepository;
    private final ZonaRepository zonaRepository;

    public EnvioServiceImpl(EnvioRepository envioRepository, ClienteRepository clienteRepository, EstadoEnvioRepository estadoEnvioRepository, ZonaRepository zonaRepository) {
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

    @Transactional
    @Override
    public Optional<Envio> save(CrearEnvioRequestDto crearEnvioRequestDto) {
        validarEnvioNoExistente(crearEnvioRequestDto.getNumeroFactura());

        Envio envio = crearEnvioDesdeRequest(crearEnvioRequestDto);
        return envioRepository.save(envio);
    }

    @Transactional
    @Override
    public Optional<Envio> update(String envioId, ActualizarEnviorRequestDto actualizarEnvioRequestDto) {
        Optional<Envio> envio = envioRepository.getById(envioId);
        if (envio.isEmpty()) {
            throw new RuntimeException("Envío no encontrado");
        }

        // Actualizar envío con la información proporcionada en el DTO
        Envio envioActualizado = actualizarEnvioDesdeRequest(envio.get(), actualizarEnvioRequestDto);
        return envioRepository.save(envioActualizado);
    }

    private void validarEnvioNoExistente(String numeroFactura) {
        Optional<Envio> envioExistente = envioRepository.getById(numeroFactura);
        if (envioExistente.isPresent()) {
            throw new RuntimeException("Envío ya existe");
        }
    }

    private Envio crearEnvioDesdeRequest(CrearEnvioRequestDto requestDto) {
        Cliente cliente = obtenerClienteDesdeRequest(requestDto.getIdCliente());
        Zona zona = obtenerZonaDesdeRequest(requestDto.getIdZona());

        List<DetalleEnvio> detallesEnvio = requestDto.getDetalleEnvio().stream()
                .map(detalleEnvioRequestDto -> new DetalleEnvio(detalleEnvioRequestDto.getNombre()))
                .toList();

        Pendiente pendiente = (Pendiente) estadoEnvioRepository.getById(1).orElseThrow(() -> new RuntimeException("Estado Pendiente no encontrado"));

        return new Envio(requestDto.getNumeroFactura(), cliente, zona, detallesEnvio, pendiente,
                requestDto.getDireccionEnvio(), requestDto.getEntreCalles(), requestDto.getUltimosDigitosTarjeta());
    }

    private Envio actualizarEnvioDesdeRequest(Envio envio, ActualizarEnviorRequestDto requestDto) {
        Cliente cliente = obtenerClienteDesdeRequest(requestDto.getIdCliente());
        Zona zona = obtenerZonaDesdeRequest(requestDto.getIdZona());

        List<DetalleEnvio> detallesEnvio = requestDto.getDetalleEnvio().stream()
                .map(detalleEnvioRequestDto -> new DetalleEnvio(detalleEnvioRequestDto.getNombre()))
                .toList();

        Pendiente pendiente = (Pendiente) estadoEnvioRepository.getById(1).orElseThrow(() -> new RuntimeException("Estado Pendiente no encontrado"));

        envio.setCliente(cliente);
        envio.setZona(zona);
        envio.setDetalleEnvio(detallesEnvio);
        envio.setCambiosEstado(new ArrayList<>(Collections.singletonList(new CambioEstado(pendiente))));
        envio.setEstadoActual(pendiente);
        envio.setDireccionEnvio(requestDto.getDireccionEnvio());
        envio.setEntreCalles(requestDto.getEntreCalles());
        envio.setUltimosDigitosTarjeta(requestDto.getUltimosDigitosTarjeta());

        return envio;
    }

    private Cliente obtenerClienteDesdeRequest(Integer clienteId) {
        return clienteRepository.getById(clienteId)
                .orElseThrow(() -> new RuntimeException("Cliente no encontrado"));
    }

    private Zona obtenerZonaDesdeRequest(Integer zonaId) {
        return zonaRepository.getById(zonaId)
                .orElseThrow(() -> new RuntimeException("Zona no encontrada"));
    }

    @Override
    public Integer cantidadEnviosPorZona(Integer idEstado, Integer idZona) {
        // Validación del idEstado
        if (idEstado != null && (idEstado < 1 || idEstado > 4)) {
            throw new IllegalArgumentException("El idEstado debe ser un número del 1 al 4 inclusive o nulo");
        }

        // Validación del idZona
        if (idZona != null && (idZona < 1 || idZona > 4)) {
            throw new IllegalArgumentException("El idZona debe ser un número del 1 al 4 inclusive");
        }

        List<Envio> envios = envioRepository.getAllFiltrado(idEstado,idZona, null);
        return envios.size();
    }


}
