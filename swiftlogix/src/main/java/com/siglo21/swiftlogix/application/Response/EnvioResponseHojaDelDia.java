package com.siglo21.swiftlogix.application.Response;

import com.siglo21.swiftlogix.domain.Model.CambioEstado;
import com.siglo21.swiftlogix.domain.Model.DetalleEnvio;
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
    private List<DetalleEnvio> detalleEnvio;
    private String direccionEnvio;
    private String entreCalles;
    private String estadoActual;
    private String ultimosDigitosTarjeta;

    public EnvioResponseHojaDelDia(Envio envio, String fechaReparto) {
        this.numeroFactura = envio.getNumeroFactura();
        this.cliente = new ClienteDelEnvioDto(envio.getCliente());
        this.zona = envio.getZona().getIdZona().toString();
        this.detalleEnvio = envio.getDetalleEnvio();
        this.direccionEnvio = envio.getDireccionEnvio();
        this.entreCalles = envio.getEntreCalles();
        this.estadoActual = buscarEstadoDeEnvioEnHoja(envio.getCambiosEstado(), fechaReparto) == null ? envio.getEstadoActual().getNombre(): buscarEstadoDeEnvioEnHoja(envio.getCambiosEstado(), fechaReparto);
        this.ultimosDigitosTarjeta = envio.getUltimosDigitosTarjeta();
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
