package com.siglo21.swiftlogix.infrastructure.entity;

import com.siglo21.swiftlogix.domain.Model.HojaDelDia;
import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.time.LocalDate;
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

    @Column(name = "fecha")
    private LocalDate fecha;

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
        hojaDelDia.setFecha(fecha);
        hojaDelDia.setCamion(camion.toDomain());
        hojaDelDia.setEnvios(envios.stream().map(EnvioEntity::toDomain).toList());
        hojaDelDia.setRepartidor(repartidor.toDomain());
        hojaDelDia.setEstadoHojaDelDia(estadoHojaDelDia.toDomain());
        return hojaDelDia;
    }


}

