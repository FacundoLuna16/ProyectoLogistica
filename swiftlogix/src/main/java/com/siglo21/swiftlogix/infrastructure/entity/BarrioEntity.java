package com.siglo21.swiftlogix.infrastructure.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Entity
@Data
@RequiredArgsConstructor
public class BarrioEntity {

    @Id
    @Column(name = "id")
    private Integer idBarrio;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "Descripcion")
    private String descripcion;

    @ManyToOne
    @JoinColumn(name = "zona_id")
    private ZonaEntity zona;

}
