package com.siglo21.swiftlogix.domain.Model;

import com.siglo21.swiftlogix.infrastructure.entity.CambioEstadoEntity;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoEnvioEntity;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public abstract class EstadoEnvio {

    protected Integer id;
    protected String nombre;


    public EstadoEnvioEntity toEntity() {
        return null;
    }

    public void entregado(Envio envio, EstadoEnvio nuevoEstado) {
    }

    public void noEntregado(Envio envio, EstadoEnvio nuevoEstado) {

    }
    public void pendiente(Envio envio, EstadoEnvio nuevoEstado){

    }

    public void enCamino(Envio envio, EstadoEnvio nuevoEstado){

    }

    public CambioEstado buscarUltimoCambioEstado(List<CambioEstado> cambioEstados){

        return cambioEstados.stream().filter(cambioEstado -> cambioEstado.getFechaHoraFin() == null).findFirst().orElse(null);
    }

    public abstract void cancelar(Envio envio, EstadoEnvio cancelado);
}
