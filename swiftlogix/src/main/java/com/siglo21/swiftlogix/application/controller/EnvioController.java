package com.siglo21.swiftlogix.application.controller;

import com.siglo21.swiftlogix.application.Response.EnvioResponse;
import com.siglo21.swiftlogix.application.request.CrearEnvioRequestDto;
import com.siglo21.swiftlogix.domain.Service.Interfaz.EnvioService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/envios")
public class EnvioController {

    private final EnvioService envioService;


    public EnvioController(EnvioService envioService) {
        this.envioService = envioService;
    }

    @GetMapping
    public ResponseEntity<?> getAll(){
        try {
            return ResponseEntity.status(200).body(envioService.getAll().stream().map(EnvioResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getById(@PathVariable("id") int id){
        try {
            return ResponseEntity.status(200).body(envioService.getById(id).map(EnvioResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping
    public ResponseEntity<?> createEnvio(@RequestBody CrearEnvioRequestDto crearEnvioRequestDto){
        try {
            return ResponseEntity.status(HttpStatus.CREATED).body(envioService.save(crearEnvioRequestDto).map(EnvioResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateEnvio(@PathVariable("id") int id, @RequestBody CrearEnvioRequestDto crearEnvioRequestDto){
        try {
            return ResponseEntity.status(HttpStatus.CREATED).body(envioService.update(id, crearEnvioRequestDto).map(EnvioResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

}
