package com.siglo21.swiftlogix.infrastructure.entity.EstadosHojaDelDia;

import com.siglo21.swiftlogix.domain.Model.EstadoHoja;
import com.siglo21.swiftlogix.domain.Model.EstadoHojaDelDia.DeCamino;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoHojaEntity;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("DE_CAMINO")
public class DeCaminoEntity extends EstadoHojaEntity {

    @Override
    public EstadoHoja toDomain() {
        DeCamino estadoHoja = new DeCamino();
        estadoHoja.setId(this.getId());
        estadoHoja.setNombre(this.getNombre());
        return estadoHoja;
    }
}
