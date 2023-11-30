package com.siglo21.swiftlogix.infrastructure.entity.EstadosEnvio;

import com.siglo21.swiftlogix.infrastructure.entity.EstadoEnvioEntity;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("ENTREGADO")
public class Entregado extends EstadoEnvioEntity {
}
