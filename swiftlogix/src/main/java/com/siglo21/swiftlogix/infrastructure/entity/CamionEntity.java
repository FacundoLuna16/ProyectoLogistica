package com.siglo21.swiftlogix.infrastructure.entity;


import com.siglo21.swiftlogix.domain.Model.Camion;
import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.List;

@Entity
@Data
@Table(name = "Camiones")
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

    public Camion toModel() {
        Camion model = new Camion();
        model.setPatente(this.patente);
        model.setModelo(this.modelo);
        model.setColor(this.color);
        model.setDescripcion(this.descripcion);
        return model;
    }
}

