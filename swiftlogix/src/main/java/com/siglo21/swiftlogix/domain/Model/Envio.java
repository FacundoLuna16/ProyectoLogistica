package com.siglo21.swiftlogix.domain.Model;

import com.siglo21.swiftlogix.infrastructure.entity.*;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
@RequiredArgsConstructor
public class Envio {
    private String numeroFactura;
    private Cliente cliente;
    private Camion camion;
    private Zona zona;
    private List<DetalleEnvio> detalleEnvio;
    private String direccionEnvio;
    private String entreCalles;
    private List<CambioEstado> cambiosEstado;
    private EstadoEnvio estadoActual;
    private String ultimosDigitosTarjeta;

    public EnvioEntity toEntity() {
        EnvioEntity envioEntity = new EnvioEntity();
        envioEntity.setNumeroFactura(this.numeroFactura);
        envioEntity.setCliente(this.cliente.toEntity());
        envioEntity.setCamion(this.camion.toEntity());
        envioEntity.setZona(this.zona.toEntity());
        envioEntity.setDetalleEnvio(this.detalleEnvio.stream().map(DetalleEnvio::toEntity).toList());
        envioEntity.setDireccionEnvio(this.direccionEnvio);
        envioEntity.setEntreCalles(this.entreCalles);
        envioEntity.setCambiosEstado(this.cambiosEstado.stream().map(CambioEstado::toEntity).toList());
        envioEntity.setEstadoActual(this.estadoActual.toEntity());
        envioEntity.setUltimosDigitosTarjeta(this.ultimosDigitosTarjeta);
        return envioEntity;
    }
}
