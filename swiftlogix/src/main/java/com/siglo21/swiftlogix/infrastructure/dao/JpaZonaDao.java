package com.siglo21.swiftlogix.infrastructure.dao;

import com.siglo21.swiftlogix.infrastructure.entity.ZonaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaZonaDao extends JpaRepository<ZonaEntity, Integer> {
}
