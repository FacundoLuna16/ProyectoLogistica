package com.siglo21.swiftlogix.application.Response;

import com.siglo21.swiftlogix.domain.Model.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public class EnvioResponse {
    private String numeroFactura;
    private Cliente cliente;
    private Zona zona;
    private List<DetalleEnvio> detalleEnvio;
    private String direccionEnvio;
    private String entreCalles;
    private List<CambioEstado> cambiosEstado;
    private EstadoEnvio estadoActual;
    private String ultimosDigitosTarjeta;

    public EnvioResponse(Envio envio) {
        this.numeroFactura = envio.getNumeroFactura();
        this.cliente = envio.getCliente();
        this.zona = envio.getZona();
        this.detalleEnvio = envio.getDetalleEnvio();
        this.direccionEnvio = envio.getDireccionEnvio();
        this.entreCalles = envio.getEntreCalles();
        this.cambiosEstado = envio.getCambiosEstado();
        this.estadoActual = envio.getEstadoActual();
        this.ultimosDigitosTarjeta = envio.getUltimosDigitosTarjeta();
    }
}
