package com.siglo21.swiftlogix.domain.Repository;


import com.siglo21.swiftlogix.domain.Model.Envio;
import java.util.List;
import java.util.Optional;

public interface EnvioRepository {

    List<Envio> getAll();

    Optional<Envio> getById(int envioId);

    Optional<Envio> save(Envio envio);

}
