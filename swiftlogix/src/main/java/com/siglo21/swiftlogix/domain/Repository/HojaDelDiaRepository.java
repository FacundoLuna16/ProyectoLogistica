package com.siglo21.swiftlogix.domain.Repository;

import com.siglo21.swiftlogix.domain.Model.HojaDelDia;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface HojaDelDiaRepository {
    List<HojaDelDia> getAll();

    Optional<HojaDelDia> getById(int hojaDelDiaId);

    Optional<HojaDelDia> save(HojaDelDia hojaDelDia);

    Optional<HojaDelDia> getHojaDelDia(LocalDate idHojaDelDia);

    List<HojaDelDia> getHojaDelDiaBetween(LocalDate startDate, LocalDate endDate);

}
