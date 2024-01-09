package com.siglo21.swiftlogix.domain.Service.Interfaz;

import com.siglo21.swiftlogix.application.request.Envios.ActualizarEnviorRequestDto;
import com.siglo21.swiftlogix.application.request.Envios.CrearEnvioRequestDto;
import com.siglo21.swiftlogix.domain.Model.Envio;

import java.util.List;
import java.util.Optional;

public interface EnvioService {
    List<Envio> getAllFiltrado(Integer idEstado, Integer idZona, Integer idCliente);

    Optional<Envio> getById(String envioId);

    Optional<Envio> save(CrearEnvioRequestDto envio);

    Optional<Envio> update(String envioId, ActualizarEnviorRequestDto envio);

    Integer cantidadEnviosPorZona(Integer idEstado, Integer idZona);

    void cerrarEnvio(String nroFactura, String descripcion);
}
