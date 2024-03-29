package com.siglo21.swiftlogix.infrastructure.entity;

import com.siglo21.swiftlogix.domain.Model.Zona;
import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.List;

@Entity
@Data
@Table(name = "Zonas")
@RequiredArgsConstructor
public class ZonaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_zona")
    private Integer idZona;

    @Column(name = "dia")
    private String dia;

    @OneToMany
    @JoinColumn
    private List<BarrioEntity> barrios;

    public Zona toDomain() {
        Zona zona = new Zona();
        zona.setIdZona(this.idZona);
        zona.setDia(this.dia);
        zona.setBarrios(this.barrios.stream().map(BarrioEntity::toDomain).toList());
        return zona;
    }
}
