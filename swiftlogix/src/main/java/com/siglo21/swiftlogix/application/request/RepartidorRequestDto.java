package com.siglo21.swiftlogix.application.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class RepartidorRequestDto {

    @NotNull(message = "El Nombre no puede ser nulo")
    @NotBlank(message = "El Nombre no puede estar vacio")
    private String nombre;

    @NotBlank(message = "El Apellido no puede estar vacio")
    @NotNull(message = "El Apellido no puede ser nulo")
    private String apellido;
}
