package com.siglo21.swiftlogix.application.Response;

import com.siglo21.swiftlogix.domain.Model.DetalleEnvio;
import com.siglo21.swiftlogix.domain.Model.Envio;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Setter
@Getter
public class EnvioResponseHojaDelDia {

    private String numeroFactura;
    private ClienteDelEnvioDto cliente;
    private String zona;
    private List<DetalleEnvio> detalleEnvio;
    private String direccionEnvio;
    private String entreCalles;
    private String estadoActual;
    private String ultimosDigitosTarjeta;

    public EnvioResponseHojaDelDia(Envio envio) {
        this.numeroFactura = envio.getNumeroFactura();
        this.cliente = new ClienteDelEnvioDto(envio.getCliente());
        this.zona = envio.getZona().getIdZona().toString();
        this.detalleEnvio = envio.getDetalleEnvio();
        this.direccionEnvio = envio.getDireccionEnvio();
        this.entreCalles = envio.getEntreCalles();
        this.estadoActual = envio.getEstadoActual().getNombre();
        this.ultimosDigitosTarjeta = envio.getUltimosDigitosTarjeta();
    }

}
