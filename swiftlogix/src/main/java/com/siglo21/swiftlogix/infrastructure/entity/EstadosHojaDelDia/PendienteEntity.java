package com.siglo21.swiftlogix.infrastructure.entity.EstadosHojaDelDia;

import com.siglo21.swiftlogix.infrastructure.entity.EstadoHojaEntity;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("PENDIENTE")
public class PendienteEntity extends EstadoHojaEntity {

}
