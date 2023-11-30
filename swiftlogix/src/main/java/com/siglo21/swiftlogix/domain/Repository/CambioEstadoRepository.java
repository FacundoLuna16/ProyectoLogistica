package com.siglo21.swiftlogix.domain.Repository;

import com.siglo21.swiftlogix.domain.Model.CambioEstado;

import java.util.List;
import java.util.Optional;

public interface CambioEstadoRepository {

    List<CambioEstado> getAll();

    Optional<CambioEstado> getById(int cambioEstadoId);

    Optional<CambioEstado> save(CambioEstado cambioEstado);

}
