package com.siglo21.swiftlogix.infrastructure.dao;

import com.siglo21.swiftlogix.infrastructure.entity.BarrioEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaBarrioDao extends JpaRepository<BarrioEntity, Integer> {
}
