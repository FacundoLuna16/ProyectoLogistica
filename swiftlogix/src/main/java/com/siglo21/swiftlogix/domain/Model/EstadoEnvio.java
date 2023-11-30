package com.siglo21.swiftlogix.domain.Model;

import com.siglo21.swiftlogix.infrastructure.entity.CambioEstadoEntity;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoEnvioEntity;

import java.util.List;

public abstract class EstadoEnvio {

    protected Integer id;
    protected String nombre;


    public EstadoEnvioEntity toEntity() {
        return null;
    }
}
