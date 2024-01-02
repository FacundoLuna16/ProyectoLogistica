package com.siglo21.swiftlogix.application.Response;

import com.siglo21.swiftlogix.domain.Model.HojaDelDia;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public class HojaDelDiaResponsePorDia {

    private Integer idHojaDelDia;
    private String fechaReparto;
    private String fechaCreacion;
    private List<EnvioResponseHojaDelDia> envios;
    private String estadoHojaDelDia;


    public HojaDelDiaResponsePorDia(HojaDelDia hojaDelDia) {
        this.idHojaDelDia = hojaDelDia.getIdHojaDelDia();
        this.fechaReparto = hojaDelDia.getFechaReparto() != null ? hojaDelDia.getFechaReparto().toString() : null;
        this.fechaCreacion = hojaDelDia.getFechaCreacion() != null ? hojaDelDia.getFechaCreacion().toString() : null;
        this.envios = hojaDelDia.getEnvios() != null ? hojaDelDia.getEnvios().stream().map(envio -> new EnvioResponseHojaDelDia(envio,this.fechaReparto)).toList() : null;
        this.estadoHojaDelDia = hojaDelDia.getEstadoHojaDelDia() != null ? hojaDelDia.getEstadoHojaDelDia().getNombre() : null;
    }

}
