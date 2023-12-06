package com.siglo21.swiftlogix.application.Response;


import com.siglo21.swiftlogix.domain.Model.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;

@Getter
@Setter
public class HojaDelDiaResponse {

    private Integer idHojaDelDia;
    private String fechaReparto;
    private String fechaCreacion;
    private String camion;
    private List<EnvioResponse> envios;
    private String repartidor;
    private String estadoHojaDelDia;


    public HojaDelDiaResponse(HojaDelDia hojaDelDia) {
        this.idHojaDelDia = hojaDelDia.getIdHojaDelDia();
        this.fechaReparto = hojaDelDia.getFechaReparto() != null ? hojaDelDia.getFechaReparto().toString() : null;
        this.fechaCreacion = hojaDelDia.getFechaCreacion() != null ? hojaDelDia.getFechaCreacion().toString() : null;
        this.camion = hojaDelDia.getCamion() != null ? hojaDelDia.getCamion().getPatente() : null;
        this.envios = hojaDelDia.getEnvios() != null ? hojaDelDia.getEnvios().stream().map(EnvioResponse::new).toList() : Collections.emptyList();
        this.repartidor = hojaDelDia.getRepartidor() != null ? hojaDelDia.getRepartidor().getNombre() : null;
        this.estadoHojaDelDia = hojaDelDia.getEstadoHojaDelDia() != null ? hojaDelDia.getEstadoHojaDelDia().getNombre() : null;
    }

}
