package com.siglo21.swiftlogix.infrastructure.entity;

import com.siglo21.swiftlogix.domain.Model.HojaDelDia;
import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Data
@Table(name = "HojasDelDia")
@RequiredArgsConstructor
public class HojaDelDiaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_hoja_del_dia")
    private Integer idHojaDelDia;

    @Column(name = "fecha_reparto")
    private LocalDate fechaReparto;


    @Column(name = "fecha_creacion")
    private LocalDateTime fechaCreacion;

    @ManyToOne
    @JoinColumn(name = "patente_camion")
    private CamionEntity camion;

    @ManyToMany
    private List<EnvioEntity> envios;

    @ManyToOne
    private RepartidorEntity repartidor;

    @ManyToOne
    private EstadoHojaEntity estadoHojaDelDia;

    public HojaDelDia toDomain() {
        HojaDelDia hojaDelDia = new HojaDelDia();
        hojaDelDia.setIdHojaDelDia(idHojaDelDia);
        hojaDelDia.setFechaReparto(fechaReparto);
        hojaDelDia.setFechaCreacion(fechaCreacion);

        hojaDelDia.setCamion(camion != null ? camion.toDomain() : null);
        hojaDelDia.setEnvios(envios.stream().map(EnvioEntity::toDomain).toList());
        hojaDelDia.setRepartidor(repartidor != null ? repartidor.toDomain() : null);
        hojaDelDia.setEstadoHojaDelDia(estadoHojaDelDia.toDomain());

        return hojaDelDia;
    }


}

