package com.siglo21.swiftlogix.application.Response;

import com.siglo21.swiftlogix.domain.Model.CambioEstado;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CambioEstadoResponse {
    private String estado;
    private String fechaInicio;
    private String fechaFin;


    public CambioEstadoResponse(CambioEstado cambioEstado) {
        this.estado = cambioEstado.getEstado().getNombre();
        this.fechaInicio = cambioEstado.getFechaHoraInicio() == null ? null : cambioEstado.getFechaHoraInicio().toLocalDate().toString();
        this.fechaFin = cambioEstado.getFechaHoraFin() == null ?  null : cambioEstado.getFechaHoraFin().toLocalDate().toString();
    }
}
