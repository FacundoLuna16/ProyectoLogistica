package com.siglo21.swiftlogix.infrastructure.dao;

import com.siglo21.swiftlogix.infrastructure.entity.EnvioEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaEnvioDao extends JpaRepository<EnvioEntity, String> {
}
