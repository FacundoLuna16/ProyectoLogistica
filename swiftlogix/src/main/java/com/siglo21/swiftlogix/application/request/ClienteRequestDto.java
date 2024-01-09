package com.siglo21.swiftlogix.application.request;


import jakarta.validation.constraints.*;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ClienteRequestDto {

    @NotNull(message = "El tipo de documento no puede ser nulo")
    @Min(value = 1, message = "El tipo de documento no es valido")
    @Max(value = 3, message = "El tipo de documento no es valido")
    private Integer idTipoDocumento;

    @NotNull(message = "El numero de documento no puede ser nulo")
    @NotBlank(message = "El numero de documento no puede estar vacio")
    private String numeroDocumento;

    @NotNull(message = "El nombre/razon social no puede ser nulo")
    @NotBlank(message = "El nombre/razon social no puede vacio")
    private String nombre;

    private String apellido;

    @NotNull(message = "La direccion no puede ser nula")
    @NotBlank(message = "La direccion no puede estar vacia")
    private String direccion;

    @NotNull(message = "El numero de telefono no puede ser nulo")
    @NotBlank(message = "El numero de telefono no puede estar vacio")
    private String numeroTelefono;
    private String numeroTelefonoAlternativo;

    private String email;

}
