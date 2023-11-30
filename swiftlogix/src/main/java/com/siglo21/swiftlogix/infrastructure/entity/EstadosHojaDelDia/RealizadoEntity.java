package com.siglo21.swiftlogix.infrastructure.entity.EstadosHojaDelDia;

import com.siglo21.swiftlogix.domain.Model.EstadoHoja;
import com.siglo21.swiftlogix.domain.Model.EstadoHojaDelDia.Realizado;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoHojaEntity;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("REALIZADO")
public class RealizadoEntity extends EstadoHojaEntity {
    @Override
    public EstadoHoja toModel() {
        Realizado model = new Realizado();
        model.setId(this.getId());
        model.setNombre(this.getNombre());
        return model;
    }
}
