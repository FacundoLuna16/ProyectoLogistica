package com.siglo21.swiftlogix.infrastructure.entity;

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

    @OneToMany
    private List<RepartidorEntity> repartidores;

    @OneToOne
    private EstadoHojaEntity estadoHojaDelDia;




}

