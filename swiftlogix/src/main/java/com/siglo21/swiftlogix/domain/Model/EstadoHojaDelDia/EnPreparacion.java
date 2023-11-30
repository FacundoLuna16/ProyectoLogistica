package com.siglo21.swiftlogix.domain.Model.EstadoHojaDelDia;

import com.siglo21.swiftlogix.domain.Model.EstadoHoja;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoHojaEntity;
import com.siglo21.swiftlogix.infrastructure.entity.EstadosHojaDelDia.EnPreparacionEntity;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@RequiredArgsConstructor
public class EnPreparacion extends EstadoHoja {
    @Override
    public EstadoHojaEntity toEntity() {
        EnPreparacionEntity entity = new EnPreparacionEntity();
        entity.setId(this.getId());
        entity.setNombre(this.getNombre());
        return entity;
    }
}
