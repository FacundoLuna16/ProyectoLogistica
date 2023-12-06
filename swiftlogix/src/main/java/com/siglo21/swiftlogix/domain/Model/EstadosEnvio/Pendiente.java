package com.siglo21.swiftlogix.domain.Model.EstadosEnvio;

import com.siglo21.swiftlogix.domain.Model.CambioEstado;
import com.siglo21.swiftlogix.domain.Model.Envio;
import com.siglo21.swiftlogix.domain.Model.EstadoEnvio;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoEnvioEntity;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Setter
@Getter
public class Pendiente extends EstadoEnvio {
    public Pendiente(Integer id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    @Override
    public EstadoEnvioEntity toEntity() {
        return new EstadoEnvioEntity(this.id, this.nombre);
    }

    @Override
    public void enCamino(Envio envio, EstadoEnvio enCamino) {
        //Finalizar el ultimo cambio de estado
        CambioEstado ultimoCambioEstado = buscarUltimoCambioEstado(envio.getCambiosEstado());
        ultimoCambioEstado.setFechaHoraFin(LocalDateTime.now());

        //Crear un nuevo cambio de estado y agregarlo al arreglo de cambios de estado del envio
        envio.addCambioEstado(new CambioEstado(enCamino));

        //Cambiar el estado actual del envio
        envio.setEstadoActual(enCamino);

    }
}
