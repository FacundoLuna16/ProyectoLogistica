package com.siglo21.swiftlogix.application.controller.soporte;

import com.siglo21.swiftlogix.domain.Service.Interfaz.HojaDelDiaService;
import io.swagger.v3.oas.annotations.Hidden;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/whatsapp")
@SecurityRequirement(name = "bearerAuth")
//@Hidden
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
