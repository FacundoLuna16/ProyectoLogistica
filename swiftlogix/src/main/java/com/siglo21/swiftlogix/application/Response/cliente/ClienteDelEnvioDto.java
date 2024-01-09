package com.siglo21.swiftlogix.application.Response.cliente;

import com.siglo21.swiftlogix.domain.Model.Cliente;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ClienteDelEnvioDto {
    private Integer idCliente;
    private String tipoDocumento;
    private String numeroDocumento;
    private String numeroTelefono;
    private String numeroAltTelefono;
    private String nombre;
    private String apellido;

    public ClienteDelEnvioDto(Cliente cliente){
        this.idCliente = cliente.getIdCliente();
        this.tipoDocumento = cliente.getTipoDocumento().getDescripcion();
        this.numeroDocumento = cliente.getNumeroDocumento();
        this.numeroTelefono = cliente.getNumeroTelefono();
        this.numeroAltTelefono = cliente.getNumeroTelefonoAlternativo();
        this.nombre = cliente.getNombre();
        this.apellido = cliente.getApellido();
    }
}
