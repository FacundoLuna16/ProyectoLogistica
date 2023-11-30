package com.siglo21.swiftlogix.application.request;

import com.siglo21.swiftlogix.domain.Model.Cliente;
import com.siglo21.swiftlogix.domain.Model.TipoDocumento;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ClienteRequestDto {
    private Integer idTipoDocumento;
    private String numeroDocumento;
    private String nombre;
    private String apellido;
    private String direccion;
    private String numeroTelefono;
    private String numeroTelefonoAlternativo;
    private String email;

}
