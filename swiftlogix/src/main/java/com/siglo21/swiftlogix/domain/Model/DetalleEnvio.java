package com.siglo21.swiftlogix.domain.Model;

import com.siglo21.swiftlogix.infrastructure.entity.DetalleEnvioEntity;
import com.siglo21.swiftlogix.infrastructure.entity.EnvioEntity;
import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@RequiredArgsConstructor
public class DetalleEnvio {

    private Integer id;
    private String nombre;
    private EnvioEntity envio;

    public DetalleEnvioEntity toEntity() {
        DetalleEnvioEntity entity = new DetalleEnvioEntity();
        entity.setId(this.id);
        entity.setNombre(this.nombre);
        entity.setEnvio(this.envio);
        return entity;
    }
}
