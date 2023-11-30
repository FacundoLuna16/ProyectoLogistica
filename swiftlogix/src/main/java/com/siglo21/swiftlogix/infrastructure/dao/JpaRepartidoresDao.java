package com.siglo21.swiftlogix.infrastructure.dao;

import com.siglo21.swiftlogix.infrastructure.entity.RepartidorEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaRepartidoresDao extends JpaRepository<RepartidorEntity, Integer>{
}
