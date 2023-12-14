package com.siglo21.swiftlogix.application.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CamionCrearRequestDto {

    @NotNull(message = "La patente no puede ser nula")
    @NotBlank(message = "La patente no puede estar vacia")
    private String patente;

    @NotNull(message = "La patente no puede ser nula")
    @NotBlank(message = "La patente no puede estar vacia")
    private String modelo;

    @NotNull(message = "El modelo no puede ser nulo")
    @NotBlank(message = "El modelo no puede estar vacio")
    private String color;

    @NotNull(message = "El color no puede ser nulo")
    @NotBlank(message = "El color no puede estar vacio")
    private String descripcion;

}
