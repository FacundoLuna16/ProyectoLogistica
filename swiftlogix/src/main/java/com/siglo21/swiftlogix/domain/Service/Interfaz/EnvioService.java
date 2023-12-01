package com.siglo21.swiftlogix.domain.Service.Interfaz;

import com.siglo21.swiftlogix.application.request.CrearEnvioRequestDto;
import com.siglo21.swiftlogix.domain.Model.Envio;

import java.util.List;
import java.util.Optional;

public interface EnvioService {
    List<Envio> getAll();

    Optional<Envio> getById(int envioId);

    Optional<Envio> save(CrearEnvioRequestDto envio);

    Optional<Envio> update(int envioId, CrearEnvioRequestDto envio);
}
