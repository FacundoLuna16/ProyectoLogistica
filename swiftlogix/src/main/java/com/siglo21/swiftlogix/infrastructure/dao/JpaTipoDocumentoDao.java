package com.siglo21.swiftlogix.infrastructure.dao;

import com.siglo21.swiftlogix.infrastructure.entity.TipoDocumentoEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaTipoDocumentoDao extends JpaRepository<TipoDocumentoEntity, Integer> {
}
