package com.siglo21.swiftlogix.infrastructure.entity.EstadosEnvio;

import com.siglo21.swiftlogix.domain.Model.EstadoEnvio;
import com.siglo21.swiftlogix.domain.Model.EstadosEnvio.NoEntregado;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoEnvioEntity;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("NO_ENTREGADO")
public class NoEntregadoEntity extends EstadoEnvioEntity {
    @Override
    public EstadoEnvio toDomain() {
        NoEntregado estado = new NoEntregado();
        estado.setId(this.id);
        estado.setNombre(this.nombre);
        return estado;
    }
}
