package com.siglo21.swiftlogix.application.controller;

import com.siglo21.swiftlogix.application.Response.EnvioResponse;
import com.siglo21.swiftlogix.application.request.ActualizarEnviorRequestDto;
import com.siglo21.swiftlogix.application.request.CrearEnvioRequestDto;
import com.siglo21.swiftlogix.domain.Service.Interfaz.EnvioService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/envios")
public class EnvioController {

    private final EnvioService envioService;


    public EnvioController(EnvioService envioService) {
        this.envioService = envioService;
    }

    @GetMapping
    @PreAuthorize("hasRole('administrador-cliente-rol')")
//    @PreAuthorize("hasRole('ROLE_administrador') or hasRole('ROLE_repartidor')")
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
    @PreAuthorize("hasRole('administrador-cliente-rol')")
    public ResponseEntity<?> getById(@PathVariable("nroFactura") String id){
        try {
            return ResponseEntity.status(200).body(envioService.getById(id).map(EnvioResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping
    @PreAuthorize("hasRole('administrador-cliente-rol')")
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
    @PreAuthorize("hasRole('administrador-cliente-rol')")
    public ResponseEntity<?> updateEnvio(@PathVariable("nroFactura") String id, @RequestBody ActualizarEnviorRequestDto crearEnvioRequestDto){
        try {
            return ResponseEntity.status(HttpStatus.CREATED).body(envioService.update(id, crearEnvioRequestDto).map(EnvioResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/cantidadEnviosPorZona")
    @PreAuthorize("hasRole('administrador-cliente-rol')")
    public ResponseEntity<?> cantidadEnviosPorZona(@RequestParam(name = "idEstado", required = false) Integer idEstado,
                                                   @RequestParam(name = "idZona", required = false) Integer idZona){
        try {
            return ResponseEntity.status(200).body(envioService.cantidadEnviosPorZona(idEstado,idZona));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }



}
