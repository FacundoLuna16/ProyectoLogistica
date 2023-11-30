package com.siglo21.swiftlogix.domain.Repository;

import com.siglo21.swiftlogix.domain.Model.EstadoEnvio;
import com.siglo21.swiftlogix.domain.Model.HojaDelDia;

import java.util.List;
import java.util.Optional;

public interface EstadoEnvioRepository {

    List<EstadoEnvio> getAll();

    Optional<EstadoEnvio> getById(int idEstadoEnvio);

    Optional<EstadoEnvio> save(EstadoEnvio estadoEnvio);


}
