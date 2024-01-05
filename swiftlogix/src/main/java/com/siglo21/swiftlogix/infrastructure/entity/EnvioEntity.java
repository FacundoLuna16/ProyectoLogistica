package com.siglo21.swiftlogix.infrastructure.entity;

import com.siglo21.swiftlogix.domain.Model.CambioEstado;
import com.siglo21.swiftlogix.domain.Model.Envio;
import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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
    @JoinColumn(name = "id_zona")
    private ZonaEntity zona;

    @OneToMany(cascade = CascadeType.ALL,orphanRemoval = true)
    @JoinColumn(name = "numero_factura")
    private List<DetalleEnvioEntity> detalleEnvio;

    @Column(name = "direccion_envio")
    private String direccionEnvio;

    @Column(name = "entre_Calles")
    private String entreCalles;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "numero_factura")
    private List<CambioEstadoEntity> cambiosEstado;

    @Column(name = "descripcion")
    private String descripcion;

    @Column(name = "tipo_envio")
    private Integer tipoEnvio; //1-Web 2-salsep 3-empresa

    @Column(name = "intentos")
    private Integer intentos; //intentos que se han hecho para entregar el envio

    @Column(name = "envio_externo")
    private Boolean envioExterno; //Los envios externos se generan en la hoja del dia automaticamente idependiente de la zona

    @Column(name = "fueraDeCiclo")
    private Boolean fueraDeCiclo; //si esta fuera del ciclo no se genera en la hoja del dia automaticamente

    @ManyToOne
    @JoinColumn(name = "id_estado", referencedColumnName = "id")
    private EstadoEnvioEntity estadoActual;

    private String ultimosDigitosTarjeta;


    public Envio toDomain() {
        Envio envio = new Envio();
        envio.setNumeroFactura(this.numeroFactura);
        envio.setCliente(this.cliente != null ? this.cliente.toDomain() : null);
        envio.setZona(this.zona != null ? this.zona.toDomain() : null);
        envio.setDireccionEnvio(this.direccionEnvio);
        envio.setEntreCalles(this.entreCalles);
        envio.setCambiosEstado(this.cambiosEstado != null ? (ArrayList<CambioEstado>) this.cambiosEstado.stream().map(CambioEstadoEntity::toDomain).collect(Collectors.toList()) : null);
        envio.setEstadoActual(this.estadoActual != null ? this.estadoActual.toDomain() : null);
        envio.setDescripcion(this.descripcion);
        envio.setTipoEnvio(this.tipoEnvio);
        envio.setIntentos(this.intentos);
        envio.setEnvioExterno(this.envioExterno);
        envio.setFueraDeCiclo(this.fueraDeCiclo);
        envio.setUltimosDigitosTarjeta(this.ultimosDigitosTarjeta);
        return envio;
    }
}

