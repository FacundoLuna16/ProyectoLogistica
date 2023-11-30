package com.siglo21.swiftlogix.infrastructure.dao;

import com.siglo21.swiftlogix.infrastructure.entity.CamionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaCamionDao extends JpaRepository<CamionEntity, Integer> {
}
