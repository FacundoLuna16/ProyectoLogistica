package com.siglo21.swiftlogix.application.Response;

import com.siglo21.swiftlogix.domain.Model.*;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Setter
@Getter
public class EnvioResponse {
    private String numeroFactura;
    private ClienteDelEnvioDto cliente;
    private String zona;
    private List<DetalleEnvio> detalleEnvio;
    private String direccionEnvio;
    private String entreCalles;
    private ArrayList<CambioEstadoResponse> cambiosEstado;
    private String estadoActual;
    private String ultimosDigitosTarjeta;

    public EnvioResponse(Envio envio) {
        this.numeroFactura = envio.getNumeroFactura();
        this.cliente = new ClienteDelEnvioDto(envio.getCliente());
        this.zona = envio.getZona().getIdZona().toString();
        this.detalleEnvio = envio.getDetalleEnvio();
        this.direccionEnvio = envio.getDireccionEnvio();
        this.entreCalles = envio.getEntreCalles();
        ArrayList<CambioEstadoResponse> cambiosEstadoArray = new ArrayList<>();
        envio.getCambiosEstado().forEach(cambioEstado -> cambiosEstadoArray.add(new CambioEstadoResponse(cambioEstado)));
        this.cambiosEstado = cambiosEstadoArray;
        this.estadoActual = envio.getEstadoActual().getNombre();
        this.ultimosDigitosTarjeta = envio.getUltimosDigitosTarjeta();
    }
}
