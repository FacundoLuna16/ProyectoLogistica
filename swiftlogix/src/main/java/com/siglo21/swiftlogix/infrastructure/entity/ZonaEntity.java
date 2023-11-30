package com.siglo21.swiftlogix.infrastructure.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.List;

@Entity
@Data
@RequiredArgsConstructor
public class ZonaEntity {

    @Id
    @Column(name = "id_zona")
    private Integer idZona;

    @Column(name = "dia")
    private String dia;

    @OneToMany(mappedBy = "zona", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<BarrioEntity> barrios;

}
