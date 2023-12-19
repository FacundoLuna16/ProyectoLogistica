package com.siglo21.swiftlogix.domain.Model;

import com.siglo21.swiftlogix.domain.Model.EstadosEnvio.Pendiente;
import com.siglo21.swiftlogix.infrastructure.entity.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Setter
@Getter
@RequiredArgsConstructor
public class Envio {
    private String numeroFactura;
    private Cliente cliente;
    private Zona zona;
    private List<DetalleEnvio> detalleEnvio;
    private String direccionEnvio;
    private String entreCalles;
    private ArrayList<CambioEstado> cambiosEstado;
    private EstadoEnvio estadoActual;
    private String ultimosDigitosTarjeta;

    public Envio(String numeroFactura, Cliente cliente, Zona zona, List<DetalleEnvio> detallesEnvio, Pendiente pendiente, String direccionEnvio, String entreCalles, String ultimosDigitosTarjeta) {
        this.numeroFactura = numeroFactura;
        this.cliente = cliente;
        this.zona = zona;
        this.detalleEnvio = detallesEnvio;
        this.direccionEnvio = direccionEnvio;
        this.entreCalles = entreCalles;
        this.cambiosEstado = new ArrayList<>(List.of(new CambioEstado(pendiente)));
        this.estadoActual = pendiente;
        this.ultimosDigitosTarjeta = ultimosDigitosTarjeta;
    }


    public EnvioEntity toEntity() {
        EnvioEntity envioEntity = new EnvioEntity();
        envioEntity.setNumeroFactura(this.numeroFactura);
        envioEntity.setCliente(this.cliente != null ? this.cliente.toEntity() : null);
        envioEntity.setZona(this.zona != null ? this.zona.toEntity() : null);
        envioEntity.setDetalleEnvio(this.detalleEnvio.stream().map(DetalleEnvio::toEntity).toList());
        envioEntity.setDireccionEnvio(this.direccionEnvio);
        envioEntity.setEntreCalles(this.entreCalles);
        envioEntity.setCambiosEstado(this.cambiosEstado != null ? this.cambiosEstado.stream().map(CambioEstado::toEntity).collect(Collectors.toList()) : null);
        envioEntity.setEstadoActual(this.estadoActual != null ? this.estadoActual.toEntity() : null);
        envioEntity.setUltimosDigitosTarjeta(this.ultimosDigitosTarjeta);
        return envioEntity;
    }

    //Metodo para cambiar el estado del envio, usando patron state debe delegar el cambio de estado a la clase estado actual
    public void entregado(EstadoEnvio entregado){
        this.estadoActual.entregado(this,entregado); //Delegacion
    }

    public void enCamino(EstadoEnvio enCamino){
        this.estadoActual.enCamino(this,enCamino);
    }


    public void noEntregado(EstadoEnvio noEntregado){
        this.estadoActual.noEntregado(this,noEntregado);
    }

    public void pendiente(EstadoEnvio pendiente){
        this.estadoActual.pendiente(this,pendiente);
    }

    public void addCambioEstado(CambioEstado cambioEstado) {
        this.cambiosEstado.add(cambioEstado);
    }
}
