package com.siglo21.swiftlogix.application.Response;

import com.siglo21.swiftlogix.domain.Model.Repartidor;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class RepartidorResponse {

    private Integer idRepartidor;
    private String nombre;
    private String apellido;

    public RepartidorResponse(Repartidor repartidor) {
        this.idRepartidor = repartidor.getIdRepartidor();
        this.nombre = repartidor.getNombre();
        this.apellido = repartidor.getApellido();
    }
}
