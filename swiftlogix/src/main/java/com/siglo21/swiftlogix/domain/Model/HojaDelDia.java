package com.siglo21.swiftlogix.domain.Model;

import com.siglo21.swiftlogix.domain.Model.EstadoHojaDelDia.EnPreparacion;
import com.siglo21.swiftlogix.infrastructure.entity.*;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@RequiredArgsConstructor
public class HojaDelDia {
    private Integer idHojaDelDia;
    private LocalDate fechaReparto;
    private LocalDateTime fechaCreacion;
    private Camion camion;
    private List<Envio> envios;
    private Repartidor repartidor;
    private EstadoHoja estadoHojaDelDia;

    public HojaDelDia(List<Envio> envios,EstadoHoja estadoHojaDelDia) {
        this.fechaCreacion = LocalDateTime.now();
        this.fechaReparto = LocalDate.now().plusDays(1);
        this.envios = envios;
        this.estadoHojaDelDia = estadoHojaDelDia;
    }

    public HojaDelDiaEntity toEntity() {
        HojaDelDiaEntity hojaDelDiaEntity = new HojaDelDiaEntity();
        hojaDelDiaEntity.setIdHojaDelDia(idHojaDelDia);
        hojaDelDiaEntity.setFechaReparto(fechaReparto);
        hojaDelDiaEntity.setFechaCreacion(fechaCreacion);
        hojaDelDiaEntity.setCamion(camion.toEntity());
        hojaDelDiaEntity.setEnvios(envios.stream().map(Envio::toEntity).toList());
        hojaDelDiaEntity.setRepartidor(repartidor.toEntity());
        hojaDelDiaEntity.setEstadoHojaDelDia(estadoHojaDelDia.toEntity());
        return hojaDelDiaEntity;
    }


}
