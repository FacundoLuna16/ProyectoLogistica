package com.siglo21.swiftlogix.domain.Repository;

import com.siglo21.swiftlogix.domain.Model.EstadoEnvio;
import com.siglo21.swiftlogix.domain.Model.EstadoHoja;

import java.util.List;
import java.util.Optional;

public interface EstadoHojaRepository {
    List<EstadoHoja> getAll();

    Optional<EstadoHoja> getById(int idEstadoHoja);

    Optional<EstadoHoja> save(EstadoHoja estadoHoja);
}
