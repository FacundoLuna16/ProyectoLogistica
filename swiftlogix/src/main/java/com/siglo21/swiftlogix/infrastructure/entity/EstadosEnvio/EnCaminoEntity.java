package com.siglo21.swiftlogix.infrastructure.entity.EstadosEnvio;

import com.siglo21.swiftlogix.domain.Model.EstadoEnvio;
import com.siglo21.swiftlogix.domain.Model.EstadosEnvio.EnCamino;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoEnvioEntity;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;

@Entity
@DiscriminatorValue("EN_CAMINO")
public class EnCaminoEntity extends EstadoEnvioEntity {

    @Override
    public EstadoEnvio toDomain() {
        EnCamino estado = new EnCamino();
        estado.setId(this.id);
        estado.setNombre(this.nombre);
        return estado;
    }




}
