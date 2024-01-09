package com.siglo21.swiftlogix.application.Response.hojaDelDia;


import com.siglo21.swiftlogix.application.Response.CamionResponse;
import com.siglo21.swiftlogix.application.Response.RepartidorResponse;
import com.siglo21.swiftlogix.application.Response.envio.EnvioResponse;
import com.siglo21.swiftlogix.domain.Model.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Collections;
import java.util.List;

@Getter
@Setter
public class HojaDelDiaResponse {

    private Integer idHojaDelDia;
    private String fechaReparto;
    private String fechaCreacion;
    private String estadoHojaDelDia;
    private RepartidorResponse repartidor;
    private CamionResponse camionResponse;
    private List<EnvioResponse> envios;


    public HojaDelDiaResponse(HojaDelDia hojaDelDia) {
        this.idHojaDelDia = hojaDelDia.getIdHojaDelDia();
        this.fechaReparto = hojaDelDia.getFechaReparto() != null ? hojaDelDia.getFechaReparto().toString() : null;
        this.fechaCreacion = hojaDelDia.getFechaCreacion() != null ? hojaDelDia.getFechaCreacion().toString() : null;
        this.envios = hojaDelDia.getEnvios() != null ? hojaDelDia.getEnvios().stream().map(EnvioResponse::new).toList() : Collections.emptyList();
        this.estadoHojaDelDia = hojaDelDia.getEstadoHojaDelDia() != null ? hojaDelDia.getEstadoHojaDelDia().getNombre() : null;
        this.repartidor = hojaDelDia.getRepartidor() != null ? new RepartidorResponse(hojaDelDia.getRepartidor()) : null;
        this.camionResponse = hojaDelDia.getCamion() != null ? new CamionResponse(hojaDelDia.getCamion()) : null;
    }

}
