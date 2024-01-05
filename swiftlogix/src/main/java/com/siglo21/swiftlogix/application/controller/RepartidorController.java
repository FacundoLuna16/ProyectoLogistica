package com.siglo21.swiftlogix.application.controller;

import com.siglo21.swiftlogix.application.Response.RepartidorResponse;
import com.siglo21.swiftlogix.application.request.RepartidorRequestDto;
import com.siglo21.swiftlogix.domain.Service.Interfaz.RepartidorService;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/repartidores")
@SecurityRequirement(name = "bearerAuth")
public class RepartidorController {

    private final RepartidorService repartidorService;


    public RepartidorController(RepartidorService repartidorService) {
        this.repartidorService = repartidorService;
    }

    @GetMapping
    public ResponseEntity<?> getAll(){
        try {
            return ResponseEntity.status(200).body(repartidorService.getAll().stream().map(RepartidorResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getById(@PathVariable("id") int id){
        try {
            return ResponseEntity.status(200).body(repartidorService.getById(id).map(RepartidorResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping
    public ResponseEntity<?> createRepartidor(@Valid @RequestBody RepartidorRequestDto repartidorRequestDto, BindingResult result){
        try {
            return ResponseEntity.status(200).body(repartidorService.save(repartidorRequestDto).map(RepartidorResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateRepartidor(@PathVariable("id") int id, @Valid @RequestBody RepartidorRequestDto repartidorRequestDto, BindingResult result){
        if (result.hasErrors()) {
            //Valida que los campos sean los que corresponden
            return ResponseEntity.badRequest().body(result.getFieldError().getDefaultMessage());
        }

        try {
            return ResponseEntity.status(200).body(repartidorService.update(id, repartidorRequestDto).map(RepartidorResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }


}
