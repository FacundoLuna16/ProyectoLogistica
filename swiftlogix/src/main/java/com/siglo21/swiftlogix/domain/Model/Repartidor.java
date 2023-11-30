package com.siglo21.swiftlogix.domain.Model;

import com.siglo21.swiftlogix.infrastructure.entity.RepartidorEntity;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@RequiredArgsConstructor
@NoArgsConstructor
public class Repartidor {
    private Integer idRepartidor;
    private String nombre;
    private String apellido;

    public RepartidorEntity toEntity() {
        RepartidorEntity repartidorEntity = new RepartidorEntity();
        repartidorEntity.setIdRepartidor(this.idRepartidor);
        repartidorEntity.setNombre(this.nombre);
        repartidorEntity.setApellido(this.apellido);
        return repartidorEntity;
    }
}
