package com.siglo21.swiftlogix.application.request;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class CrearEnvioRequestDto {
    private String numeroFactura;
    private Integer idCliente;
    private Integer idZona;
    private List<DetalleEnvioRequestDto> detalleEnvio;
    private String direccionEnvio;
    private String entreCalles;
    private String ultimosDigitosTarjeta;
}
