package com.siglo21.swiftlogix.application.Response;

import com.siglo21.swiftlogix.domain.Model.Zona;
import com.siglo21.swiftlogix.infrastructure.entity.BarrioEntity;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public class ZonaResponse {

    private Integer idZona;
    private String dia;
    private List<BarrioResponse> barrios;

    public ZonaResponse(Zona zona) {
        this.idZona = zona.getIdZona();
        this.dia = zona.getDia();
        this.barrios = zona.getBarrios().stream().map(BarrioResponse::new).toList();

    }
}
