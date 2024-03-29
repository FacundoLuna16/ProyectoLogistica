package com.siglo21.swiftlogix.application.controller;


import com.siglo21.swiftlogix.application.Response.envio.EnvioResponse;
import com.siglo21.swiftlogix.application.request.Envios.ActualizarEnviorRequestDto;
import com.siglo21.swiftlogix.application.request.Envios.CrearEnvioRequestDto;
import com.siglo21.swiftlogix.domain.Service.Interfaz.EnvioService;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/envios")
@SecurityRequirement(name = "bearerAuth")
public class EnvioController {

    private final EnvioService envioService;


    public EnvioController(EnvioService envioService) {
        this.envioService = envioService;
    }

    @GetMapping
    public ResponseEntity<?> getAll(
            @RequestParam(name = "idEstado", required = false) Integer idEstado,
            @RequestParam(name = "idZona", required = false) Integer idZona,
            @RequestParam(name = "idCliente", required = false) Integer idCliente) {
        try {
            return ResponseEntity.status(200).body(envioService.getAllFiltrado(idEstado,idZona,idCliente).stream().map(EnvioResponse::new));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }


    @GetMapping("/{nroFactura}")
    public ResponseEntity<?> getById(@PathVariable("nroFactura") String id){
        try {
            return ResponseEntity.status(200).body(envioService.getById(id).map(EnvioResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping
    public ResponseEntity<?> createEnvio(@Valid @RequestBody CrearEnvioRequestDto crearEnvioRequestDto, BindingResult result){
        if (result.hasErrors()) {
            return ResponseEntity.badRequest().body(result.getFieldError().getDefaultMessage());
        }
        try {
            return ResponseEntity.status(HttpStatus.CREATED).body(envioService.save(crearEnvioRequestDto).map(EnvioResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{nroFactura}")
    public ResponseEntity<?> updateEnvio(@PathVariable("nroFactura") String id, @RequestBody ActualizarEnviorRequestDto crearEnvioRequestDto){
        try {
            return ResponseEntity.status(HttpStatus.CREATED).body(envioService.update(id, crearEnvioRequestDto).map(EnvioResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/cantidadEnviosPorZona")
    public ResponseEntity<?> cantidadEnviosPorZona(@RequestParam(name = "idEstado", required = false) Integer idEstado,
                                                   @RequestParam(name = "idZona", required = false) Integer idZona){
        try {
            return ResponseEntity.status(200).body(envioService.cantidadEnviosPorZona(idEstado,idZona));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/cerrarEnvio")
    public ResponseEntity<?> cerrarEnvio(@RequestParam String nroFactura, @RequestParam String descripcion){
        if (descripcion.isEmpty()) {
            return ResponseEntity.badRequest().body("La descripcion no puede estar vacia");
        }
        try {
            envioService.cerrarEnvio(nroFactura,descripcion);
            return ResponseEntity.status(200).body(null);
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/subirImagen/{nroFactura}")
    public ResponseEntity<?> SubirImagen(@PathVariable("nroFactura") String id, @RequestBody MultipartFile imagen){
        try {
            return ResponseEntity.status(HttpStatus.CREATED).body(envioService.subirImagen(id, imagen));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping(
            value = "/obtenerImagen/{nroFactura}",
            produces = MediaType.IMAGE_JPEG_VALUE
    )
    public ResponseEntity<?> obtenerImagen(@PathVariable("nroFactura") String nroFactura) {
        try {
            // Construir la ruta completa del archivo
            String nombreArchivo = nroFactura + ".jpg";
            File carpeta = new File("swiftlogix/src/main/resources/fotosEnviosNoEntregado");
            File archivo = new File(carpeta, nombreArchivo);

            if (!archivo.exists()) {
                // Devolver una respuesta HTTP 404 si el archivo no se encuentra y agregar un comentario
                return ResponseEntity.status(HttpStatus.NOT_FOUND)
                        .body("No se encontró la imagen para la factura con número: " + nroFactura);
            }

            // Leer bytes desde el archivo y devolver en la respuesta
            byte[] imagenBytes = Files.readAllBytes(archivo.toPath());
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imagenBytes);
        } catch (IOException e) {
            // Manejar otros errores y devolver una respuesta HTTP 500
            e.printStackTrace();  // Considera loguear el error
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al obtener la imagen para la factura con número: " + nroFactura);

        }
    }





}
