package com.siglo21.swiftlogix.application.controller;

import com.siglo21.swiftlogix.application.Response.CamionResponse;
import com.siglo21.swiftlogix.application.Response.ClienteResponse;
import com.siglo21.swiftlogix.application.Response.EnvioResponse;
import com.siglo21.swiftlogix.application.request.CamionCrearRequestDto;
import com.siglo21.swiftlogix.application.request.CamionRequestDto;
import com.siglo21.swiftlogix.application.request.CrearEnvioRequestDto;
import com.siglo21.swiftlogix.domain.Service.Interfaz.CamionService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/camiones")
public class CamionController {

    private final CamionService camionService;


    public CamionController(CamionService camionService) {
        this.camionService = camionService;
    }

    @GetMapping
    @PreAuthorize("hasRole('administrador-cliente-rol')")
    public ResponseEntity<?> getAll(){
        try {
            return ResponseEntity.status(200).body(camionService.getAll().stream().map(CamionResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }


    @GetMapping("/{patente}")
    @PreAuthorize("hasRole('administrador-cliente-rol')")
    public ResponseEntity<?> getById(@PathVariable("patente") String patente){
        try {
            return ResponseEntity.status(200).body(camionService.getById(patente).map(CamionResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping
    @PreAuthorize("hasRole('administrador-cliente-rol')")
    public ResponseEntity<?> createEnvio(@Valid @RequestBody CamionCrearRequestDto camionRequestDto, BindingResult result){
        if (result.hasErrors()) {
            return ResponseEntity.badRequest().body(result.getFieldError().getDefaultMessage());
        }
        try {
            return ResponseEntity.status(HttpStatus.CREATED).body(camionService.save(camionRequestDto).map(CamionResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{patente}")
    @PreAuthorize("hasRole('administrador-cliente-rol')")
    public ResponseEntity<?> updateEnvio(@PathVariable("patente") String patente, @Valid @RequestBody CamionRequestDto camionRequestDto, BindingResult result){
        if (result.hasErrors()) {
            return ResponseEntity.badRequest().body(result.getFieldError().getDefaultMessage());
        }
        try {
            return ResponseEntity.status(HttpStatus.CREATED).body(camionService.update(patente, camionRequestDto).map(CamionResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

}
