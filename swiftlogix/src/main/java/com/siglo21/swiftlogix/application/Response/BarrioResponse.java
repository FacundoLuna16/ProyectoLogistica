package com.siglo21.swiftlogix.application.Response;

import com.siglo21.swiftlogix.domain.Model.Barrio;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BarrioResponse {
    private String nombre;

    public BarrioResponse(Barrio barrio) {
        this.nombre = barrio.getNombre();
    }
}
