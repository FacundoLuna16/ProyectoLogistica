package com.siglo21.swiftlogix.domain.Model;

import com.siglo21.swiftlogix.infrastructure.entity.*;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@RequiredArgsConstructor
public class HojaDelDia {
    private Integer idHojaDelDia;
    private LocalDate fecha;
    private Camion camion;
    private List<Envio> envios;
    private Repartidor repartidor;
    private EstadoHoja estadoHojaDelDia;


    public HojaDelDiaEntity toEntity() {
        HojaDelDiaEntity hojaDelDiaEntity = new HojaDelDiaEntity();
        hojaDelDiaEntity.setIdHojaDelDia(idHojaDelDia);
        hojaDelDiaEntity.setFecha(fecha);
        hojaDelDiaEntity.setCamion(camion.toEntity());
        hojaDelDiaEntity.setEnvios(envios.stream().map(Envio::toEntity).toList());
        hojaDelDiaEntity.setRepartidor(repartidor.toEntity());
        hojaDelDiaEntity.setEstadoHojaDelDia(estadoHojaDelDia.toEntity());
        return hojaDelDiaEntity;
    }


}
