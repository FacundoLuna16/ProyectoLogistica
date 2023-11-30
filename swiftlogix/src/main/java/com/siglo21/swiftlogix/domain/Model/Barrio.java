package com.siglo21.swiftlogix.domain.Model;


import com.siglo21.swiftlogix.infrastructure.entity.BarrioEntity;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public class Barrio {

    private Integer idBarrio;

    private String nombre;

    private String descripcion;



    public BarrioEntity toEntity() {
        BarrioEntity entity = new BarrioEntity();
        entity.setIdBarrio(this.idBarrio);
        entity.setNombre(this.nombre);
        entity.setDescripcion(this.descripcion);
        return entity;
    }
}
