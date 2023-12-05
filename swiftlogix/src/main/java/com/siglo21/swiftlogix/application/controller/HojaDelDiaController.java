package com.siglo21.swiftlogix.application.controller;


import com.siglo21.swiftlogix.application.Response.HojaDelDiaResponse;
import com.siglo21.swiftlogix.domain.Service.Interfaz.HojaDelDiaService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/hojas")
public class HojaDelDiaController {

    private final HojaDelDiaService hojaDelDiaService;

    public HojaDelDiaController(HojaDelDiaService hojaDelDiaService) {
        this.hojaDelDiaService = hojaDelDiaService;
    }


    @GetMapping
    public ResponseEntity<?> getAll(){
        try {
            return ResponseEntity.status(200).body(hojaDelDiaService.getAll().stream().map(HojaDelDiaResponse::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
