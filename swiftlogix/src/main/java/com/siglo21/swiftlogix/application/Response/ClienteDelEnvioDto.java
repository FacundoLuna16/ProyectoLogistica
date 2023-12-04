package com.siglo21.swiftlogix.application.Response;

import com.siglo21.swiftlogix.domain.Model.Cliente;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ClienteDelEnvioDto {
    private Integer idCliente;
    private String tipoDocumento;
    private String numeroDocumento;
    private String nombre;
    private String apellido;

    public ClienteDelEnvioDto(Cliente cliente){
        this.idCliente = cliente.getIdCliente();
        this.tipoDocumento = cliente.getTipoDocumento().getDescripcion();
        this.numeroDocumento = cliente.getNumeroDocumento();
        this.nombre = cliente.getNombre();
        this.apellido = cliente.getApellido();
    }
}
