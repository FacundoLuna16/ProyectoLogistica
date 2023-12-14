package com.siglo21.swiftlogix.application.controller;

import com.siglo21.swiftlogix.application.Response.CamionResponse;
import com.siglo21.swiftlogix.application.Response.ClienteResponse;
import com.siglo21.swiftlogix.application.Response.EnvioResponse;
import com.siglo21.swiftlogix.application.request.CamionRequestDto;
import com.siglo21.swiftlogix.application.request.CrearEnvioRequestDto;
import com.siglo21.swiftlogix.domain.Service.Interfaz.CamionService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/camiones")
public class CamionController {

    private final CamionService camionService;


    public CamionController(CamionService camionService) {
        this.camionService = camionService;
    }

    @GetMapping
    public ResponseEntity<?> getAll(){
        try {
            return ResponseEntity.status(200).body(camionService.getAll().stream().map(CamionResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }


    @GetMapping("/{id}")
    public ResponseEntity<?> getById(@PathVariable("id") String patente){
        try {
            return ResponseEntity.status(200).body(camionService.getById(patente).map(CamionResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping
    public ResponseEntity<?> createEnvio(@Valid @RequestBody CamionRequestDto camionRequestDto, BindingResult result){
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


    @PutMapping("/{id}")
    public ResponseEntity<?> updateEnvio(@PathVariable("id") String patente, @Valid @RequestBody CamionRequestDto camionRequestDto, BindingResult result){
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
