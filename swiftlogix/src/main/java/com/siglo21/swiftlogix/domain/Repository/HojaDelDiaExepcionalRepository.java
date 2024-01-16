package com.siglo21.swiftlogix.domain.Repository;

import com.siglo21.swiftlogix.domain.Model.HojaDelDiaExepcional;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface HojaDelDiaExepcionalRepository {
    List<HojaDelDiaExepcional> getAll();

    Optional<HojaDelDiaExepcional> getById(int idEstadoHoja);

    Optional<HojaDelDiaExepcional> save(HojaDelDiaExepcional estadoHoja);


    Optional<HojaDelDiaExepcional> getByFechaReparto(LocalDate fechaReparto);
}
