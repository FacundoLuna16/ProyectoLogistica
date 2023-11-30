package com.siglo21.swiftlogix.infrastructure.dao;

import com.siglo21.swiftlogix.infrastructure.entity.EstadoEnvioEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaEstadoEnvioDao extends JpaRepository<EstadoEnvioEntity, Integer> {
}
