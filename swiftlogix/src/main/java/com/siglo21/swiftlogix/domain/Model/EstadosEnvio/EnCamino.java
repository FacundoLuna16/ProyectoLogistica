package com.siglo21.swiftlogix.domain.Model.EstadosEnvio;

import com.siglo21.swiftlogix.domain.Model.EstadoEnvio;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoEnvioEntity;
import com.siglo21.swiftlogix.infrastructure.entity.EstadosEnvio.EnCaminoEntity;



public class EnCamino extends EstadoEnvio{

    @Override
    public EstadoEnvioEntity toEntity() {
        EnCaminoEntity estado = new EnCaminoEntity();
        estado.setId(this.id);
        estado.setNombre(this.nombre);
        return estado;
    }


    public void setId(Long id) {
        this.id = id;
    }
    public void setNombre(String nombre) {this.nombre = nombre;}
    public Long getId() {return this.id;}
    public String getNombre() {return this.nombre;}
}
