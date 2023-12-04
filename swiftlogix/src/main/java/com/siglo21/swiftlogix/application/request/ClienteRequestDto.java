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

    @NotNull(message = "El nombre no puede ser nulo")
    @NotBlank(message = "El nombre no puede estar vacio")
    private String nombre;

    @NotNull(message = "El apellido no puede ser nulo")
    @NotBlank(message = "El apellido no puede estar vacio")
    private String apellido;

    @NotNull(message = "La direccion no puede ser nula")
    @NotBlank(message = "La direccion no puede estar vacia")
    private String direccion;

    @NotNull(message = "El numero de telefono no puede ser nulo")
    @NotBlank(message = "El numero de telefono no puede estar vacio")
    private String numeroTelefono;
    private String numeroTelefonoAlternativo;

    @Email(message = "El email no es valido")
    private String email;

}
