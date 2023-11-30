package com.siglo21.swiftlogix.domain.Repository;

import com.siglo21.swiftlogix.domain.Model.Barrio;

import java.util.List;
import java.util.Optional;

public interface BarrioRepository {

    List<Barrio> getAll();

    Optional<Barrio> getById(int barrioId);

    Optional<Barrio> save(Barrio barrio);

}
