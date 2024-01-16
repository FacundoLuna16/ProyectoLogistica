package com.siglo21.swiftlogix.domain.Service;

import com.siglo21.swiftlogix.application.request.Envios.ActualizarEnviorRequestDto;
import com.siglo21.swiftlogix.application.request.Envios.CrearEnvioRequestDto;
import com.siglo21.swiftlogix.domain.Model.*;
import com.siglo21.swiftlogix.domain.Model.EstadosEnvio.Pendiente;
import com.siglo21.swiftlogix.domain.Repository.*;
import com.siglo21.swiftlogix.domain.Service.Interfaz.EnvioService;
import com.siglo21.swiftlogix.domain.exchangePort.WhatsappService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.*;

public class EnvioServiceImpl implements EnvioService {

    private final EnvioRepository envioRepository;
    private final ClienteRepository clienteRepository;

    private final EstadoEnvioRepository estadoEnvioRepository;
    private final ZonaRepository zonaRepository;

    private final WhatsappService whatsappService;

    public EnvioServiceImpl(EnvioRepository envioRepository, ClienteRepository clienteRepository, EstadoEnvioRepository estadoEnvioRepository, ZonaRepository zonaRepository, WhatsappService whatsappService) {
        this.envioRepository = envioRepository;
        this.clienteRepository = clienteRepository;
        this.estadoEnvioRepository = estadoEnvioRepository;
        this.zonaRepository = zonaRepository;
        this.whatsappService = whatsappService;
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
        Optional<Envio> envioGuardado = envioRepository.save(envio);

        //manejo de whatsapp
        String numero = envio.getCliente().getNumeroTelefono();
        String numeroFactura = envio.getNumeroFactura();
        //TODO: DESCOMENTAR ENVIO DE WHATSAPP
//        whatsappService.enviarMensaje(numero, numeroFactura,2);

        return envioGuardado;
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
        Optional<Envio> envioExistente = envioRepository.getByNroFacturaNoExiste(numeroFactura);
        if (envioExistente.isPresent()) {
            throw new RuntimeException("Envío ya existe");
        }
    }

    private Envio crearEnvioDesdeRequest(CrearEnvioRequestDto requestDto) {
        Cliente cliente = obtenerClienteDesdeRequest(requestDto.getIdCliente());
        Zona zona = obtenerZonaDesdeRequest(requestDto.getIdZona());


        Pendiente pendiente = (Pendiente) estadoEnvioRepository.getById(1).orElseThrow(() -> new RuntimeException("Estado Pendiente no encontrado"));

        return new Envio(requestDto.getNumeroFactura(), cliente, zona, pendiente,
                requestDto.getDireccionEnvio(), requestDto.getEntreCalles(),
                requestDto.getUltimosDigitosTarjeta(),requestDto.getDescripcion(),
                requestDto.getTipoEnvio(),requestDto.getEnvioExterno());
    }

    private Envio actualizarEnvioDesdeRequest(Envio envio, ActualizarEnviorRequestDto requestDto) {
        Cliente cliente = obtenerClienteDesdeRequest(requestDto.getIdCliente());
        Zona zona = obtenerZonaDesdeRequest(requestDto.getIdZona());
        
        envio.setCliente(cliente);
        envio.setZona(zona);
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

    @Override
    public void cerrarEnvio(String nroFactura, String descripcion) {
        //Buscar el envio por el numero de factura
        Envio envio = envioRepository.getByNroFactura(nroFactura).get();
        if (!envio.estaPendiente()) throw new RuntimeException("El envio no enPendiente");
        //Lo marca en camino
        EstadoEnvio cancelado = estadoEnvioRepository.getById(5).get();


        //Cambiar el estado del envio a entregado
        envio.cancelado(cancelado);
        envio.setDescripcion(descripcion);
        envio.setIntentos(0);

        //Guardar el envio
        envioRepository.save(envio);
    }

    @Override
    public String subirImagen(String nroFactura, MultipartFile file) {
        try {
            String nombreArchivo = nroFactura;
            byte[] bytes = file.getBytes();

            String fileOriginalName = file.getOriginalFilename();

            long fileSize = file.getSize();
            long maximoDeFoto = 5 * 1024 * 1024; // para 5MB

            if (fileSize > maximoDeFoto) {
                throw new RuntimeException("El tamaño de la imagen no puede ser mayor a 5MB");
            }

            // Siempre utilizar la extensión ".jpg" al guardar
            String extension = ".jpg";

            String nuevoArchivoNombre = nombreArchivo + extension;

            File carpeta = new File("swiftlogix/src/main/resources/fotosEnviosNoEntregado");
            if (!carpeta.exists()){
                carpeta.mkdirs();
            }

            Path path = Paths.get("swiftlogix/src/main/resources/fotosEnviosNoEntregado/" + nuevoArchivoNombre);
            Files.write(path, bytes);


            return "cargado con éxito,Archivo guardado en: " + path.toAbsolutePath().toString();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }




}
