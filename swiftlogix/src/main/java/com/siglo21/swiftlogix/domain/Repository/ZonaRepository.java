package com.siglo21.swiftlogix.domain.Repository;

import com.siglo21.swiftlogix.domain.Model.Zona;

import java.util.List;
import java.util.Optional;

public interface ZonaRepository {

    List<Zona> getAll();

    Optional<Zona> getById(int zonaId);

    Optional<Zona> save(Zona zona);

}
