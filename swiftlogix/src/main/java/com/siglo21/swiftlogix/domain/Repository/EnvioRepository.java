package com.siglo21.swiftlogix.domain.Repository;


import com.siglo21.swiftlogix.domain.Model.Envio;
import java.util.List;
import java.util.Optional;

public interface EnvioRepository {

    List<Envio> getAllFiltrado(Integer idEstado, Integer idZona, Integer idCliente);

    Optional<Envio> getById(String envioId);

    Optional<Envio> save(Envio envio);

}
