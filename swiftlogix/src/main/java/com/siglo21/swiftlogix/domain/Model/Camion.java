package com.siglo21.swiftlogix.domain.Model;

import com.siglo21.swiftlogix.application.request.CamionCrearRequestDto;
import com.siglo21.swiftlogix.application.request.CamionRequestDto;
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
public class Camion {

    private String patente;
    private String modelo;
    private String color;
    private String descripcion;

    public Camion(CamionCrearRequestDto entity) {
        this.patente = entity.getPatente();
        this.modelo = entity.getModelo();
        this.color = entity.getColor();
        this.descripcion = entity.getDescripcion();
    }

    public Camion(CamionRequestDto camionRequestDto, String patenteCamion) {
        this.patente = patenteCamion;
        this.modelo = camionRequestDto.getModelo();
        this.color = camionRequestDto.getColor();
        this.descripcion = camionRequestDto.getDescripcion();
    }

    public CamionEntity toEntity() {
        CamionEntity entity = new CamionEntity();
        entity.setPatente(this.patente);
        entity.setModelo(this.modelo);
        entity.setColor(this.color);
        entity.setDescripcion(this.descripcion);
        return entity;
    }
}
