package com.siglo21.swiftlogix.infrastructure.dao;

import com.siglo21.swiftlogix.infrastructure.entity.HojaDelDiaExepcionalEntity;
import io.micrometer.observation.ObservationFilter;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;

public interface JpaHojaDelDiaExepcionalDao extends JpaRepository<HojaDelDiaExepcionalEntity, Integer> {

    //buscamos por fecha de reparto
    HojaDelDiaExepcionalEntity findByFechaReparto(LocalDate fechaReparto);
}
