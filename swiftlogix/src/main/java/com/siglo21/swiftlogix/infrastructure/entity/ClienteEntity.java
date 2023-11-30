package com.siglo21.swiftlogix.infrastructure.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Entity
@Data
@RequiredArgsConstructor
public class ClienteEntity {

    //
    @Id
    @Column(name = "ID_CLIENTE")
    private Integer idCliente;


    //relacion a tipoDocumento
    @ManyToOne
    @JoinColumn(name = "id_tipo_documento")
    private TipoDocumentoEntity tipoDocumento;

    @Column(name = "numero_documento")
    private String numeroDocumento;


    @Column(name = "nombre")
    private String nombre;

    @Column(name = "apellido")
    private String apellido;

    @Column(name = "direccion")
    private String direccion;

    @Column(name = "numero_telefono")
    private String numeroTelefono;

    @Column(name = "numero_telefono_alternativo")
    private String numeroTelefonoAlternativo;

    @Column(name = "email")
    private String email;


}
