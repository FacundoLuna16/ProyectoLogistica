package com.siglo21.swiftlogix.domain.Model.EstadoHojaDelDia;

import com.siglo21.swiftlogix.domain.Model.EstadoHoja;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoHojaEntity;
import com.siglo21.swiftlogix.infrastructure.entity.EstadosHojaDelDia.RealizadoEntity;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@RequiredArgsConstructor
public class Realizado extends EstadoHoja {
    @Override
    public EstadoHojaEntity toEntity() {
        RealizadoEntity entity = new RealizadoEntity();
        entity.setId(this.getId());
        entity.setNombre(this.getNombre());
        return entity;
    }
}
