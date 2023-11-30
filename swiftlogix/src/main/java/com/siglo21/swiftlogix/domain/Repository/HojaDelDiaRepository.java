package com.siglo21.swiftlogix.domain.Repository;

import com.siglo21.swiftlogix.domain.Model.HojaDelDia;

import java.util.List;
import java.util.Optional;

public interface HojaDelDiaRepository {
    List<HojaDelDia> findAll();

    Optional<HojaDelDia> getById(int hojaDelDiaId);

    Optional<HojaDelDia> save(HojaDelDia hojaDelDia);

    Optional<HojaDelDia> update(HojaDelDia hojaDelDia);
}
