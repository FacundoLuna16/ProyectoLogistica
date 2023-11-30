package com.siglo21.swiftlogix.domain.Model;

import com.siglo21.swiftlogix.infrastructure.entity.CamionEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@RequiredArgsConstructor
@NoArgsConstructor
public class Camion {

    private String patente;
    private String modelo;
    private String color;
    private String descripcion;

    public CamionEntity toEntity() {
        CamionEntity entity = new CamionEntity();
        entity.setPatente(this.patente);
        entity.setModelo(this.modelo);
        entity.setColor(this.color);
        entity.setDescripcion(this.descripcion);
        return entity;
    }
}
