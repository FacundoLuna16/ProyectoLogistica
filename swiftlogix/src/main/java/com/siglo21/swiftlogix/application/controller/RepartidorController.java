package com.siglo21.swiftlogix.application.controller;

import com.siglo21.swiftlogix.application.Response.RepartidorResponse;
import com.siglo21.swiftlogix.application.request.RepartidorRequestDto;
import com.siglo21.swiftlogix.domain.Service.Interfaz.RepartidorService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/repartidores")
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
    public ResponseEntity<?> getById(int id){
        try {
            return ResponseEntity.status(200).body(repartidorService.getById(id).map(RepartidorResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping
    public ResponseEntity<?> createRepartidor(@RequestBody RepartidorRequestDto repartidorRequestDto){
        try {
            return ResponseEntity.status(200).body(repartidorService.save(repartidorRequestDto).map(RepartidorResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateRepartidor(@PathVariable("id") int id, @RequestBody RepartidorRequestDto repartidorRequestDto){
        try {
            return ResponseEntity.status(200).body(repartidorService.update(id, repartidorRequestDto).map(RepartidorResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }


}
