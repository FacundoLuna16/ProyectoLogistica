package com.siglo21.swiftlogix.application.controller;

import com.siglo21.swiftlogix.application.Response.cliente.ClienteResponse;
import com.siglo21.swiftlogix.application.request.ClienteRequestDto;
import com.siglo21.swiftlogix.domain.Service.Interfaz.ClienteService;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.CrossOrigin;


@CrossOrigin
@RestController
@RequestMapping("/api/v1/clientes")
@SecurityRequirement(name = "bearerAuth")
public class ClienteController {

    private final ClienteService clienteService;

    public ClienteController(ClienteService clienteService) {
        this.clienteService = clienteService;
    }

    @GetMapping
    public ResponseEntity<?> getAll(){
        try {
            return ResponseEntity.status(200).body(clienteService.getAll().stream().map(ClienteResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getById(@PathVariable("id") int id){
        try {
            return ResponseEntity.status(200).body(clienteService.getById(id).map(ClienteResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping
    public ResponseEntity<?> createCliente(@Valid @RequestBody ClienteRequestDto clienteRequestDto, BindingResult result){
        if (result.hasErrors()) {
            return ResponseEntity.badRequest().body(result.getFieldError().getDefaultMessage());
        }
        try {
            return ResponseEntity.status(HttpStatus.CREATED).body(clienteService.save(clienteRequestDto).map(ClienteResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateCliente( @PathVariable("id") int id,@Valid @RequestBody ClienteRequestDto clienteRequestDto, BindingResult result){
        if (result.hasErrors()) {
            return ResponseEntity.badRequest().body(result.getFieldError().getDefaultMessage());
        }
        try {
            return ResponseEntity.status(200).body(clienteService.update(id, clienteRequestDto).map(ClienteResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

}
