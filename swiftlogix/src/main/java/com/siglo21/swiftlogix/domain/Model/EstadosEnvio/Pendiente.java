package com.siglo21.swiftlogix.domain.Model.EstadosEnvio;

import com.siglo21.swiftlogix.domain.Model.EstadoEnvio;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoEnvioEntity;
import com.siglo21.swiftlogix.infrastructure.entity.EstadosEnvio.PendienteEntity;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@RequiredArgsConstructor
public class Pendiente extends EstadoEnvio {

    @Override
    public EstadoEnvioEntity toEntity() {
        PendienteEntity estado = new PendienteEntity();
        estado.setId(this.id);
        estado.setNombre(this.nombre);
        return estado;
    }
}