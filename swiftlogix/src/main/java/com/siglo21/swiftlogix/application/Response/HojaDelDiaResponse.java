package com.siglo21.swiftlogix.application.Response;


import com.siglo21.swiftlogix.domain.Model.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;
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
        this.fechaReparto = hojaDelDia.getFechaReparto().toString();
        this.fechaCreacion = hojaDelDia.getFechaCreacion().toString();
        this.camion = hojaDelDia.getCamion().getPatente();
        this.envios = hojaDelDia.getEnvios().stream().map(EnvioResponse::new).toList();
        this.repartidor = hojaDelDia.getRepartidor().getNombre();
        this.estadoHojaDelDia = hojaDelDia.getEstadoHojaDelDia().getNombre();
    }
}
