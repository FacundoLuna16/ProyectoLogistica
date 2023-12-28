package com.siglo21.swiftlogix.domain.Model;

import com.siglo21.swiftlogix.infrastructure.entity.BarrioEntity;
import com.siglo21.swiftlogix.infrastructure.entity.ZonaEntity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
@RequiredArgsConstructor
public class Zona {

    private Integer idZona;
    private String dia;
    private List<Barrio> barrios;

    public ZonaEntity toEntity() {
        ZonaEntity entity = new ZonaEntity();
        entity.setIdZona(this.idZona);
        entity.setDia(this.dia);
        entity.setBarrios(this.barrios.stream().map(Barrio::toEntity).toList());
        return entity;
    }
}
