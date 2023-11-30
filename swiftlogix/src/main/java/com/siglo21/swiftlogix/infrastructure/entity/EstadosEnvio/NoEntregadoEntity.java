package com.siglo21.swiftlogix.infrastructure.entity.EstadosEnvio;

import com.siglo21.swiftlogix.infrastructure.entity.EstadoEntity;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("NO_ENTREGADO")
public class NoEntregadoEntity extends EstadoEntity {
}
