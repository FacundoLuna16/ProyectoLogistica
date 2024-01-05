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
    private String direccionEnvio;
    private String entreCalles;
    private ArrayList<CambioEstadoResponse> cambiosEstado;
    private String estadoActual;
    private String ultimosDigitosTarjeta;
    private String descripcion;
    private Integer tipoEnvio; //1-Web 2-salsep 3-empresa
    private Integer intentos; //intentos que se han hecho para entregar el envio
    private Boolean envioExterno; //Los envios externos se generan en la hoja del dia automaticamente idependiente de la zona
    private Boolean fueraDeCiclo; //si esta fuera del ciclo no se genera en la hoja del dia automaticamente

    public EnvioResponse(Envio envio) {
        this.numeroFactura = envio.getNumeroFactura();
        this.cliente = new ClienteDelEnvioDto(envio.getCliente());
        this.zona = envio.getZona().getIdZona().toString();
        this.direccionEnvio = envio.getDireccionEnvio();
        this.entreCalles = envio.getEntreCalles();
        ArrayList<CambioEstadoResponse> cambiosEstadoArray = new ArrayList<>();
        envio.getCambiosEstado().forEach(cambioEstado -> cambiosEstadoArray.add(new CambioEstadoResponse(cambioEstado)));
        this.cambiosEstado = cambiosEstadoArray;
        this.estadoActual = envio.getEstadoActual().getNombre();
        this.ultimosDigitosTarjeta = envio.getUltimosDigitosTarjeta();
        this.descripcion = envio.getDescripcion();
        this.tipoEnvio = envio.getTipoEnvio();
        this.intentos = envio.getIntentos();
        this.envioExterno = envio.getEnvioExterno();
        this.fueraDeCiclo = envio.getFueraDeCiclo();
    }
}
