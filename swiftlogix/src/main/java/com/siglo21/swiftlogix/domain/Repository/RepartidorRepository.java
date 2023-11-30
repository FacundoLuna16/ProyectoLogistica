package com.siglo21.swiftlogix.domain.Repository;

import com.siglo21.swiftlogix.domain.Model.HojaDelDia;
import com.siglo21.swiftlogix.domain.Model.Repartidor;

import java.util.List;
import java.util.Optional;

public interface RepartidorRepository {
    List<Repartidor> getAll();

    Optional<Repartidor> getById(int repartidorId);

    Optional<Repartidor> save(Repartidor repartidor);

}
