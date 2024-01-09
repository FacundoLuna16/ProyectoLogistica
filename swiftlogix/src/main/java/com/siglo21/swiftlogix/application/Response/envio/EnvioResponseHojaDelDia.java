package com.siglo21.swiftlogix.application.Response.envio;

import com.siglo21.swiftlogix.application.Response.cliente.ClienteDelEnvioDto;
import com.siglo21.swiftlogix.domain.Model.CambioEstado;
import com.siglo21.swiftlogix.domain.Model.Envio;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Setter
@Getter
public class EnvioResponseHojaDelDia {

    private String numeroFactura;
    private ClienteDelEnvioDto cliente;
    private String zona;
    private String direccionEnvio;
    private String entreCalles;
    private String estadoActual;
    private String ultimosDigitosTarjeta;
    private String descripcion;//descripcion del envio para que coloquen quien entrego el pedido individualmente
    private Integer tipoEnvio; //1-Web 2-salsep 3-empresa
    private Integer intentos; //intentos que se han hecho para entregar el envio
    private Boolean envioExterno; //Los envios externos se generan en la hoja del dia automaticamente idependiente de la zona
    private Boolean fueraDeCiclo; //si esta fuera del ciclo no se genera en la hoja del dia automaticamente


    public EnvioResponseHojaDelDia(Envio envio, String fechaReparto) {
        this.numeroFactura = envio.getNumeroFactura();
        this.cliente = new ClienteDelEnvioDto(envio.getCliente());
        this.zona = envio.getZona().getIdZona().toString();
        this.direccionEnvio = envio.getDireccionEnvio();
        this.entreCalles = envio.getEntreCalles();
        this.estadoActual = buscarEstadoDeEnvioEnHoja(envio.getCambiosEstado(), fechaReparto) == null ? envio.getEstadoActual().getNombre(): buscarEstadoDeEnvioEnHoja(envio.getCambiosEstado(), fechaReparto);
        this.ultimosDigitosTarjeta = envio.getUltimosDigitosTarjeta();
        this.descripcion = envio.getDescripcion();
        this.tipoEnvio = envio.getTipoEnvio();
        this.intentos = envio.getIntentos();
        this.envioExterno = envio.getEnvioExterno();
        this.fueraDeCiclo = envio.getFueraDeCiclo();
    }

    public String buscarEstadoDeEnvioEnHoja(List<CambioEstado> cambioEstados, String fechaReparto) {
        LocalDate fechaRepartoLocalDate = LocalDate.parse(fechaReparto);

        Optional<String> estadoEncontrado = cambioEstados.stream()
                .filter(cambioEstado -> cambioEstado.getFechaHoraInicio() != null &&
                        cambioEstado.getFechaHoraInicio().toLocalDate().equals(fechaRepartoLocalDate.minusDays(1)) &&
                        !"EnCamino".equals(cambioEstado.getEstado().getNombre()) &&
                        !"Pendiente".equals(cambioEstado.getEstado().getNombre()))
                .map(cambioEstado -> cambioEstado.getEstado().getNombre())
                .findFirst();

        return estadoEncontrado.orElse(null);
    }

}
