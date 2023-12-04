package com.siglo21.swiftlogix.domain.Model.EstadoHojaDelDia;

import com.siglo21.swiftlogix.domain.Model.EstadoHoja;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoHojaEntity;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@RequiredArgsConstructor
public class Realizado extends EstadoHoja {
    public Realizado(Integer id, String nombre) {
            this.id = id;
            this.nombre = nombre;
    }

    @Override
    public EstadoHojaEntity toEntity() {
        return new EstadoHojaEntity(this.id, this.nombre);
    }
}
