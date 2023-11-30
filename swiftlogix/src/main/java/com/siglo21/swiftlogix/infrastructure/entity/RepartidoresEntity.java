package com.siglo21.swiftlogix.infrastructure.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Entity
@Data
@RequiredArgsConstructor
public class RepartidoresEntity {

    @Id
    @Column(name = "id_repartidor")
    private Integer idRepartidor;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "apellido")
    private String apellido;
}
