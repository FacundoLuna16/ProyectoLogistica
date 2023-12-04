package com.siglo21.swiftlogix.application.Response;

import com.siglo21.swiftlogix.domain.Model.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public class EnvioResponse {
    private String numeroFactura;
    private String cliente;
    private String zona;
    private List<DetalleEnvio> detalleEnvio;
    private String direccionEnvio;
    private String entreCalles;
    private String estadoActual;
    private String ultimosDigitosTarjeta;

    public EnvioResponse(Envio envio) {
        this.numeroFactura = envio.getNumeroFactura();
        this.cliente = envio.getCliente().getNombre();
        this.zona = envio.getZona().getIdZona().toString();
        this.detalleEnvio = envio.getDetalleEnvio();
        this.direccionEnvio = envio.getDireccionEnvio();
        this.entreCalles = envio.getEntreCalles();
        this.estadoActual = envio.getEstadoActual().getNombre();
        this.ultimosDigitosTarjeta = envio.getUltimosDigitosTarjeta();
    }
}
