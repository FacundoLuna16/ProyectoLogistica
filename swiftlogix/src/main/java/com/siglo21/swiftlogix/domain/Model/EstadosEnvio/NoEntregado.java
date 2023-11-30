package com.siglo21.swiftlogix.domain.Model.EstadosEnvio;

import com.siglo21.swiftlogix.domain.Model.EstadoEnvio;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoEnvioEntity;
import com.siglo21.swiftlogix.infrastructure.entity.EstadosEnvio.NoEntregadoEntity;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public class NoEntregado extends EstadoEnvio {
    @Override
    public EstadoEnvioEntity toEntity() {
        NoEntregadoEntity estado = new NoEntregadoEntity();
        estado.setId(this.id);
        estado.setNombre(this.nombre);
        return estado;
    }
}
