package com.siglo21.swiftlogix.infrastructure.entity.EstadosEnvio;

import com.siglo21.swiftlogix.domain.Model.EstadoEnvio;
import com.siglo21.swiftlogix.domain.Model.EstadosEnvio.Pendiente;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoEnvioEntity;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("PENDIENTE")
public class PendienteEntity extends EstadoEnvioEntity {
    @Override
    public EstadoEnvio toDomain() {
        Pendiente estado = new Pendiente();
        estado.setId(this.id);
        estado.setNombre(this.nombre);
        return estado;
    }
}

