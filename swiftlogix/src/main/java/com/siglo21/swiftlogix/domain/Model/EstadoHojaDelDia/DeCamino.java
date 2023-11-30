package com.siglo21.swiftlogix.domain.Model.EstadoHojaDelDia;

import com.siglo21.swiftlogix.domain.Model.EstadoHoja;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoHojaEntity;
import com.siglo21.swiftlogix.infrastructure.entity.EstadosHojaDelDia.DeCaminoEntity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;

public class DeCamino extends EstadoHoja {

    @Override
    public EstadoHojaEntity toEntity() {
        DeCaminoEntity entity = new DeCaminoEntity();
        entity.setId(this.getId());
        entity.setNombre(this.getNombre());
        return entity;
    }
}
