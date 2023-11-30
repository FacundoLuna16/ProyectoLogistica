package com.siglo21.swiftlogix.infrastructure.dao;

import com.siglo21.swiftlogix.infrastructure.entity.CambioEstadoEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaCambioEstadoDao extends JpaRepository<CambioEstadoEntity, Integer> {
}
