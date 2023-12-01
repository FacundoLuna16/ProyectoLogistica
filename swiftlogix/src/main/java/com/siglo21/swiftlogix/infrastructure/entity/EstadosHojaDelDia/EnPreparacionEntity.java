package com.siglo21.swiftlogix.infrastructure.entity.EstadosHojaDelDia;

import com.siglo21.swiftlogix.domain.Model.EstadoHoja;
import com.siglo21.swiftlogix.domain.Model.EstadoHojaDelDia.EnPreparacion;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoHojaEntity;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("EN_PREPARACION")
public class EnPreparacionEntity extends EstadoHojaEntity {

    @Override
    public EstadoHoja toDomain() {
        EnPreparacion estadoHoja = new EnPreparacion();
        estadoHoja.setId(this.getId());
        estadoHoja.setNombre(this.getNombre());
        return estadoHoja;
    }
}
