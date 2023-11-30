package com.siglo21.swiftlogix.domain.Repository;

import com.siglo21.swiftlogix.domain.Model.DetalleEnvio;

import java.util.List;
import java.util.Optional;

public interface DetalleEnvioRepository {
    List<DetalleEnvio> getAll();

    Optional<DetalleEnvio> getById(int detalleEnvioId);

    Optional<DetalleEnvio> save(DetalleEnvio detalleEnvio);

    Optional<DetalleEnvio> update(DetalleEnvio detalleEnvio);
}
