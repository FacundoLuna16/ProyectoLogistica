package com.siglo21.swiftlogix.infrastructure.dao;

import com.siglo21.swiftlogix.infrastructure.entity.DetalleEnvioEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaDetalleEnvioDao extends JpaRepository<DetalleEnvioEntity, Integer> {
}
