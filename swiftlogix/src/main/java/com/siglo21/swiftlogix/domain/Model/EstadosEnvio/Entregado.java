package com.siglo21.swiftlogix.domain.Model.EstadosEnvio;

import com.siglo21.swiftlogix.domain.Model.EstadoEnvio;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoEnvioEntity;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public class Entregado extends EstadoEnvio {

    public Entregado(Integer id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    @Override
    public EstadoEnvioEntity toEntity() {
        return new EstadoEnvioEntity(this.id, this.nombre);
    }
}
