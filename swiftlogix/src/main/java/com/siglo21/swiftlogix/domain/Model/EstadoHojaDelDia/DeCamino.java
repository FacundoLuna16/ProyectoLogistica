package com.siglo21.swiftlogix.domain.Model.EstadoHojaDelDia;

import com.siglo21.swiftlogix.domain.Model.EstadoHoja;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoHojaEntity;

public class DeCamino extends EstadoHoja {

    public DeCamino(Integer id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    @Override
    public EstadoHojaEntity toEntity() {
        return new EstadoHojaEntity(this.id, this.nombre);
    }
}
