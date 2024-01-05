package com.siglo21.swiftlogix.application.controller;

import com.siglo21.swiftlogix.domain.Service.Interfaz.HojaDelDiaService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/whatsapp")
public class pruebaWhatsappController {

    private final HojaDelDiaService hojaDelDiaService;

    public pruebaWhatsappController(HojaDelDiaService hojaDelDiaService) {
        this.hojaDelDiaService = hojaDelDiaService;
    }

    @PostMapping
    public void pruebaWhatsapp(@RequestBody List<String> numeros){
        try {
            hojaDelDiaService.enviarMensaje(numeros);
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
