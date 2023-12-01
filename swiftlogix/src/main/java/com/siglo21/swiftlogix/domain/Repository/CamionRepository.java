package com.siglo21.swiftlogix.domain.Repository;

import com.siglo21.swiftlogix.domain.Model.Camion;

import java.util.List;
import java.util.Optional;

public interface CamionRepository {

    List<Camion> getAll();

    Optional<Camion> getById(String patenteCamion);

    Optional<Camion> save(Camion camion);

}
