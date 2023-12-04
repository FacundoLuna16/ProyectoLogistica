package com.siglo21.swiftlogix.application.request;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CamionRequestDto {

    private String patente;
    private String modelo;
    private String color;
    private String descripcion;

}
