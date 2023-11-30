package com.siglo21.swiftlogix.infrastructure.entity.EstadosHojaDelDia;

import com.siglo21.swiftlogix.infrastructure.entity.EstadoHojaEntity;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("EnPreparacion")
public class EnPreparacionEntity extends EstadoHojaEntity {

}
