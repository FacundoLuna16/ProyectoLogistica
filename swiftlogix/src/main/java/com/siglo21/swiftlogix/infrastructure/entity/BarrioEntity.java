package com.siglo21.swiftlogix.infrastructure.entity;

import com.siglo21.swiftlogix.domain.Model.Barrio;
import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Entity
@Data
@Table(name = "Barrios")
@RequiredArgsConstructor
public class BarrioEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer idBarrio;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "Descripcion")
    private String descripcion;

    public Barrio toDomain() {
        Barrio barrio = new Barrio();
        barrio.setIdBarrio(this.idBarrio);
        barrio.setNombre(this.nombre);
        barrio.setDescripcion(this.descripcion);
        return barrio;
    }


}
