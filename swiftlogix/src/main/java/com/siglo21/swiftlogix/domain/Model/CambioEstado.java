package com.siglo21.swiftlogix.domain.Model;

import com.siglo21.swiftlogix.infrastructure.entity.CambioEstadoEntity;
import com.siglo21.swiftlogix.infrastructure.entity.EnvioEntity;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoEnvioEntity;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Setter
@Getter
@RequiredArgsConstructor
public class CambioEstado {
    private Integer idCambio;
    private LocalDateTime fechaHoraInicio;
    private LocalDateTime fechaHoraFin;
    private EstadoEnvioEntity estado;

    public CambioEstadoEntity toEntity() {
        CambioEstadoEntity entity = new CambioEstadoEntity();
        entity.setIdCambio(idCambio);
        entity.setFechaHoraInicio(fechaHoraInicio);
        entity.setFechaHoraFin(fechaHoraFin);
        entity.setEstado(estado);
        return entity;
    }
}
