package com.siglo21.swiftlogix.infrastructure.dao;

import com.siglo21.swiftlogix.infrastructure.entity.EstadoHojaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaEstadoHojaDao extends JpaRepository<EstadoHojaEntity, Integer> {
}
