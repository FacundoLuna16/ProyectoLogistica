package com.siglo21.swiftlogix.infrastructure.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Entity
@Data
@RequiredArgsConstructor
public class ClienteEntity {

    //
    @Id
    @Column(name = "ID")
    private String ID;

    

    @Column(name = "NOMBRE")
    private String nombre;

    @Column(name = "APELLIDO")
    private String apellido;

    @Column(name = "DIRECCION")
    private String direccion;

    @Column(name = "NUMERO_TELEFONO")
    private String numeroTelefono;

    @Column(name = "NUMERO_TELEFONO_ALTERNATIVO")
    private String numeroTelefonoAlternativo;

    @Column(name = "EMAIL")
    private String email;


}
