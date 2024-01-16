package com.siglo21.swiftlogix.application.controller;

import com.siglo21.swiftlogix.domain.Service.Interfaz.HojaDelDiaExepcionalService;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/hojasExepcionales")
@SecurityRequirement(name = "bearerAuth")
public class HojaDelDiaExepcionalController {

    private final HojaDelDiaExepcionalService hojaDelDiaExepcionalService;

    public HojaDelDiaExepcionalController(HojaDelDiaExepcionalService hojaDelDiaExepcionalService) {
        this.hojaDelDiaExepcionalService = hojaDelDiaExepcionalService;
    }

    @GetMapping
    public ResponseEntity<?> getAll(){
        try {
            return ResponseEntity.status(200).body(hojaDelDiaExepcionalService.getAll());
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/{fechaReparto}")
    public ResponseEntity<?> getHojaDelDia(@PathVariable LocalDate fechaReparto){
        try {
            return ResponseEntity.status(200).body(hojaDelDiaExepcionalService.getHojaDelDia(fechaReparto));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }


    @PostMapping
    public ResponseEntity<?> generarHojaDelDia(@RequestBody List<String> idsEnvios,
                                               @RequestParam LocalDate fechaReparto,
                                               @RequestParam String idCamion,
                                               @RequestParam Integer idRepartidor){
        try {
            return ResponseEntity.status(200).body(hojaDelDiaExepcionalService.generarHojaDelDia(idsEnvios,
                    fechaReparto, idCamion, idRepartidor));
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

}
