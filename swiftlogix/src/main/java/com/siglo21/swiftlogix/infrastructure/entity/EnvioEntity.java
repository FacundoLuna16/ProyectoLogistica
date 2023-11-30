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
    @Column(name = "numero_factura")
    private String numeroFactura;

    @ManyToOne
    @JoinColumn(name = "id_cliente")
    private ClienteEntity cliente;

    @ManyToOne
    @JoinColumn(name = "patente")
    private CamionEntity camion;

    @ManyToOne
    @JoinColumn(name = "id_zona")
    private ZonaEntity zona;

    @OneToMany(mappedBy = "envio")
    private List<DetalleEnvioEntity> detalleEnvio;

    @Column(name = "direccion_envio")
    private String direccionEnvio;

    @OneToMany(mappedBy = "envio")
    private List<CambioEstadoEntity> cambiosEstado;


    @OneToOne
    @JoinColumn(name = "id_estado")
    private EstadoEnvioEntity estadoActual;

    private String ultimosDigitosTarjeta;
}

