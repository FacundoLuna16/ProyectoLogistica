package com.siglo21.swiftlogix.infrastructure.dao;

import com.siglo21.swiftlogix.infrastructure.entity.ClienteEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaClienteDao extends JpaRepository<ClienteEntity, Integer> {
}
