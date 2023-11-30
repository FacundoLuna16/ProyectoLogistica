package com.siglo21.swiftlogix.infrastructure.entity;

import com.siglo21.swiftlogix.domain.Model.Envio;
import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.List;

@Entity
@Data
@Table(name = "Envios")
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

    @OneToMany
    @JoinColumn(name = "numero_factura")
    private List<DetalleEnvioEntity> detalleEnvio;

    @Column(name = "direccion_envio")
    private String direccionEnvio;

    @Column(name = "entre_Calles")
    private String entreCalles;

    @OneToMany
    @JoinColumn(name = "numero_factura")
    private List<CambioEstadoEntity> cambiosEstado;


    @OneToOne
    @JoinColumn(name = "id_estado")
    private EstadoEnvioEntity estadoActual;

    private String ultimosDigitosTarjeta;


    public Envio toDomain() {
        Envio envio = new Envio();
        envio.setNumeroFactura(this.numeroFactura);
        envio.setCliente(this.cliente.toDomain());
        envio.setCamion(this.camion.toDomain());
        envio.setZona(this.zona.toDomain());
        envio.setDetalleEnvio(this.detalleEnvio.stream().map(DetalleEnvioEntity::toDomain).toList());
        envio.setDireccionEnvio(this.direccionEnvio);
        envio.setEntreCalles(this.entreCalles);
        envio.setCambiosEstado(this.cambiosEstado.stream().map(CambioEstadoEntity::toDomain).toList());
        envio.setEstadoActual(this.estadoActual.toDomain());
        envio.setUltimosDigitosTarjeta(this.ultimosDigitosTarjeta);
        return envio;
    }
}

