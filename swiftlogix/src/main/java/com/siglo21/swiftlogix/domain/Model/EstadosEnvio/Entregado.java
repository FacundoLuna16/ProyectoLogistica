package com.siglo21.swiftlogix.domain.Model.EstadosEnvio;

import com.siglo21.swiftlogix.domain.Model.EstadoEnvio;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoEnvioEntity;
import com.siglo21.swiftlogix.infrastructure.entity.EstadosEnvio.EntregadoEntity;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public class Entregado extends EstadoEnvio {

    @Override
    public EstadoEnvioEntity toEntity() {
        EntregadoEntity estado = new EntregadoEntity();
        estado.setId(this.id);
        estado.setNombre(this.nombre);
        return estado;
    }
}
