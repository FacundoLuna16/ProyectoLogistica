package com.siglo21.swiftlogix.infrastructure.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.List;

@Entity
@Data
@RequiredArgsConstructor
public class EnvioEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "envio_id")
    private Long id;

    private String nroFactura;

    @ManyToOne
    @JoinColumn(name = "cliente_id")
    private ClienteEntity cliente;

    @ManyToOne
    @JoinColumn(name = "camion_id")
    private CamionEntity camion;

    @ManyToOne
    @JoinColumn(name = "zona_id")
    private ZonaEntity zona;

    @Column(name = "direccion_envio")
    private String direccionEnvio;

    @OneToMany(mappedBy = "envio", cascade = CascadeType.ALL)
    private List<CambioEstadoEntity> cambiosEstado;

    @OneToOne
    @JoinColumn(name = "estado_actual_id")
    private EstadoEnvioEntity estadoActual;

    private int ultimosDigitosTarjeta;
}

