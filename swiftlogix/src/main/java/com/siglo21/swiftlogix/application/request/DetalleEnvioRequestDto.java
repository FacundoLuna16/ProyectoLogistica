package com.siglo21.swiftlogix.application.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DetalleEnvioRequestDto {

    @NotNull(message = "El Nombre del Detalle no puede ser nulo")
    @NotBlank(message = "El Nombre del Detalle no puede estar vacio")
    private String nombre;

}
