package com.siglo21.swiftlogix.application.request.Envios;

import com.siglo21.swiftlogix.application.request.validaciones.NumeroFacturaValid;
import jakarta.validation.constraints.*;
import lombok.Getter;
import lombok.Setter;

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

    @NotBlank(message = "La direccion de envio no puede estar vacia")
    @NotNull(message = "La direccion de envio no puede ser nula")
    private String direccionEnvio;

    private String entreCalles;

    private String ultimosDigitosTarjeta;

    private String descripcion;

    @Min(value = 1, message = "El tipo de envio debe ser al menos 1")
    @Max(value = 3, message = "El tipo de envio no puede ser mayor que 3")
    private Integer tipoEnvio;

    private Boolean envioExterno = false; // Default value changed to false

}
