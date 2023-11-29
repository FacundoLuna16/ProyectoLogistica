package com.siglo21.swiftlogix.infrastructure.entity;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Entity
@Data
@RequiredArgsConstructor
public class CamionEntity {

    @Id
    @Column(name = "PATENTE")
    private String patente;

    @Column(name = "")
    private String modelo;

    private String color;

    private String descripcion;
}
