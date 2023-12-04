package com.siglo21.swiftlogix.application.request;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class CrearEnvioRequestDto {

    @NotNull(message = "El numero de factura no puede ser nulo")
    @NotBlank(message = "El numero de factura no puede estar vacio")
    private String numeroFactura;

    @Positive(message = "El id del cliente no puede ser negativo")
    @NotNull(message = "El id del cliente no puede ser nulo")
    private Integer idCliente;

    @Positive(message = "El id del tipo de documento no puede ser negativo")
    @NotNull(message = "El id del tipo de documento no puede ser nulo")
    @Max(value = 4, message = "El tipo de documento no es valido")
    private Integer idZona;

    private List<DetalleEnvioRequestDto> detalleEnvio;

    @NotBlank(message = "La direccion de envio no puede estar vacia")
    @NotNull(message = "La direccion de envio no puede ser nula")
    private String direccionEnvio;


    private String entreCalles;

    private String ultimosDigitosTarjeta;
}
