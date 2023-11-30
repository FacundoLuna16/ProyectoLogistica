package com.siglo21.swiftlogix.infrastructure.entity;


import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.List;

@Entity
@Data
@RequiredArgsConstructor
public class CamionEntity {
    @Id
    @Column(name = "patente")
    private String patente;

    @Column(name = "modelo")
    private String modelo;

    @Column(name = "color")
    private String color;

    @Column(name = "descripcion")
    private String descripcion;
}

