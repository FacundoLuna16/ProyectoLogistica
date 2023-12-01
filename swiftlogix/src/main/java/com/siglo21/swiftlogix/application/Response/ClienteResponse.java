package com.siglo21.swiftlogix.application.Response;

import com.siglo21.swiftlogix.domain.Model.Cliente;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ClienteResponse {
    private String tipoDocumento;
    private String numeroDocumento;
    private String nombre;
    private String apellido;
    private String direccion;
    private String numeroTelefono;
    private String numeroTelefonoAlternativo;
    private String email;

    public ClienteResponse(Cliente cliente){
        this.tipoDocumento = cliente.getTipoDocumento().getDescripcion();
        this.numeroDocumento = cliente.getNumeroDocumento();
        this.nombre = cliente.getNombre();
        this.apellido = cliente.getApellido();
        this.direccion = cliente.getDireccion();
        this.numeroTelefono = cliente.getNumeroTelefono();
        this.numeroTelefonoAlternativo = cliente.getNumeroTelefonoAlternativo();
        this.email = cliente.getEmail();
    }
}
