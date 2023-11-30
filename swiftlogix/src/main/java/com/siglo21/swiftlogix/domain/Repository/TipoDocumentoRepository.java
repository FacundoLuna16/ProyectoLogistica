package com.siglo21.swiftlogix.domain.Repository;

import com.siglo21.swiftlogix.domain.Model.TipoDocumento;

import java.util.List;
import java.util.Optional;

public interface TipoDocumentoRepository {
    List<TipoDocumento> getAll();

    Optional<TipoDocumento> getById(int tipoDocumentoId);

    Optional<TipoDocumento> save(TipoDocumento tipoDocumento);

}
