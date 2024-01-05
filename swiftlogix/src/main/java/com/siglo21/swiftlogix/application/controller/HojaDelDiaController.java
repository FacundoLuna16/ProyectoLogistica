package com.siglo21.swiftlogix.application.controller;


import com.siglo21.swiftlogix.application.Response.HojaDelDiaResponse;
import com.siglo21.swiftlogix.application.Response.HojaDelDiaResponsePorDia;
import com.siglo21.swiftlogix.domain.Service.Interfaz.HojaDelDiaService;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.time.LocalDate;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/hojas")
@SecurityRequirement(name = "bearerAuth")
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

    @PutMapping("/iniciarEntrega")
    public ResponseEntity<?> marcarEnCamino(@RequestParam Integer idHojaDelDia){
        try {
            hojaDelDiaService.iniciarEntrega(idHojaDelDia);
            return ResponseEntity.status(200).body(null);
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/cerrarHojaDelDia")
    public ResponseEntity<?> cerrarHojaDelDia(@RequestParam Integer idHojaDelDia,@RequestBody List<String> idsEnviosEntregados){
        try {
            hojaDelDiaService.cerrarHojaDelDia(idHojaDelDia, idsEnviosEntregados);
            return ResponseEntity.status(200).body(null);
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/generarHojaDelDia")
    public ResponseEntity<?> generarHojaDelDia(){
        try {
            hojaDelDiaService.generarHojaDelDia();
            return ResponseEntity.status(200).body(null);
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/getHojaDelDia")
    public ResponseEntity<?> getHojaDelDia(@RequestParam LocalDate fechaReparto){
        try {
            return ResponseEntity.status(200).body(new HojaDelDiaResponsePorDia(hojaDelDiaService.getHojaDelDia(fechaReparto)));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/getHojaDelDiaSemanal")
    public ResponseEntity<?> getHojaDelDiaSemanal(@RequestParam LocalDate fechaDeSemana){
        try {
            return ResponseEntity.status(200).body(hojaDelDiaService.getHojaDelDiaSemanal(fechaDeSemana).stream().map(HojaDelDiaResponsePorDia::new));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }


}
