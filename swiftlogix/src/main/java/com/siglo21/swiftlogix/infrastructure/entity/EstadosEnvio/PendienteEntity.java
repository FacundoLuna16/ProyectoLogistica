package com.siglo21.swiftlogix.infrastructure.entity.EstadosEnvio;

import com.siglo21.swiftlogix.infrastructure.entity.EstadoEnvioEntity;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("PENDIENTE")
public class PendienteEntity extends EstadoEnvioEntity {
}

