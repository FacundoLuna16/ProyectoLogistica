package com.siglo21.swiftlogix.infrastructure.dao;

import com.siglo21.swiftlogix.infrastructure.entity.HojaDelDiaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface JpaHojaDelDiaDao extends JpaRepository<HojaDelDiaEntity, Integer> {
    HojaDelDiaEntity findByFechaReparto(LocalDate fechaReparto);

    List<HojaDelDiaEntity> findByFechaRepartoBetween(LocalDate startDate, LocalDate endDate);
}
