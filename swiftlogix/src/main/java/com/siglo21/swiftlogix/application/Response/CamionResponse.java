package com.siglo21.swiftlogix.application.Response;

import com.siglo21.swiftlogix.domain.Model.Camion;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CamionResponse {

    private String patente;
    private String modelo;

    public CamionResponse(Camion camion) {
        this.patente = camion.getPatente();
        this.modelo = camion.getModelo();
    }

}
