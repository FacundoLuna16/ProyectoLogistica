package com.siglo21.swiftlogix.infrastructure.dao;

import com.siglo21.swiftlogix.infrastructure.entity.HojaDelDiaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaHojaDelDiaDao extends JpaRepository<HojaDelDiaEntity, Integer> {
}
