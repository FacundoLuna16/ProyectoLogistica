package com.siglo21.swiftlogix.infrastructure.entity.EstadosEnvio;

import com.siglo21.swiftlogix.domain.Model.EstadoEnvio;
import com.siglo21.swiftlogix.domain.Model.EstadosEnvio.Entregado;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoEnvioEntity;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("ENTREGADO")
public class EntregadoEntity extends EstadoEnvioEntity {
    @Override
    public EstadoEnvio toDomain() {
        Entregado estado = new Entregado();
        estado.setId(this.id);
        estado.setNombre(this.nombre);
        return estado;
    }
}
