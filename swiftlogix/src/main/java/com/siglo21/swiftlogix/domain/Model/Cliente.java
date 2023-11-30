package com.siglo21.swiftlogix.domain.Model;

import com.siglo21.swiftlogix.infrastructure.entity.ClienteEntity;
import com.siglo21.swiftlogix.infrastructure.entity.TipoDocumentoEntity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@RequiredArgsConstructor
public class Cliente {

    private Integer idCliente;
    private TipoDocumento tipoDocumento;
    private String numeroDocumento;
    private String nombre;
    private String apellido;
    private String direccion;
    private String numeroTelefono;
    private String numeroTelefonoAlternativo;
    private String email;

    public ClienteEntity toEntity() {
        ClienteEntity entity = new ClienteEntity();
        entity.setIdCliente(idCliente);
        entity.setTipoDocumento(tipoDocumento.toEntity());
        entity.setNumeroDocumento(numeroDocumento);
        entity.setNombre(nombre);
        entity.setApellido(apellido);
        entity.setDireccion(direccion);
        entity.setNumeroTelefono(numeroTelefono);
        entity.setNumeroTelefonoAlternativo(numeroTelefonoAlternativo);
        entity.setEmail(email);
        return entity;
    }
}
