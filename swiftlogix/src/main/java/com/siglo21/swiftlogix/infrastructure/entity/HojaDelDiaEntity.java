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

    @OneToMany
    private List<EnvioEntity> envios;

    @ManyToOne
    private RepartidorEntity repartidor;

    @OneToOne
    private EstadoHojaEntity estadoHojaDelDia;

    public HojaDelDia toDomain() {
        HojaDelDia hojaDelDia = new HojaDelDia();
        hojaDelDia.setIdHojaDelDia(idHojaDelDia);
        hojaDelDia.setFechaReparto(fechaReparto);
        hojaDelDia.setFechaCreacion(fechaCreacion);
        hojaDelDia.setCamion(camion.toDomain());
        hojaDelDia.setEnvios(envios.stream().map(EnvioEntity::toDomain).toList());
        hojaDelDia.setRepartidor(repartidor.toDomain());
        hojaDelDia.setEstadoHojaDelDia(estadoHojaDelDia.toDomain());
        return hojaDelDia;
    }


}

