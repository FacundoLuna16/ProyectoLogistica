package com.siglo21.swiftlogix.domain.Model.EstadosEnvio;

import com.siglo21.swiftlogix.domain.Model.EstadoEnvio;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoEnvioEntity;
import com.siglo21.swiftlogix.infrastructure.entity.EstadosEnvio.EnCaminoEntity;
import lombok.Getter;
import lombok.Setter;



public class EnCamino extends EstadoEnvio{

    @Override
    public EstadoEnvioEntity toEntity() {
        EnCaminoEntity estado = new EnCaminoEntity();
        estado.setId(this.id);
        estado.setNombre(this.nombre);
        return estado;
    }


}
