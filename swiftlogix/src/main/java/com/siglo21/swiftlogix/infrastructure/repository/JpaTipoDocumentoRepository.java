package com.siglo21.swiftlogix.infrastructure.repository;

import com.siglo21.swiftlogix.domain.Model.TipoDocumento;
import com.siglo21.swiftlogix.domain.Repository.TipoDocumentoRepository;
import com.siglo21.swiftlogix.infrastructure.dao.JpaHojaDelDiaDao;
import com.siglo21.swiftlogix.infrastructure.dao.JpaTipoDocumentoDao;
import com.siglo21.swiftlogix.infrastructure.entity.TipoDocumentoEntity;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class JpaTipoDocumentoRepository implements TipoDocumentoRepository {

    private final JpaTipoDocumentoDao jpaTipoDocumentoDao;

    public JpaTipoDocumentoRepository(JpaTipoDocumentoDao jpaTipoDocumentoDao) {
        this.jpaTipoDocumentoDao = jpaTipoDocumentoDao;
    }


    @Override
    public List<TipoDocumento> getAll() {
        return jpaTipoDocumentoDao.findAll().stream().map(TipoDocumentoEntity::toDomain).toList();
    }

    @Override
    public Optional<TipoDocumento> getById(int tipoDocumentoId) {
        return jpaTipoDocumentoDao.findById(tipoDocumentoId).map(TipoDocumentoEntity::toDomain);
    }

    @Override
    public Optional<TipoDocumento> save(TipoDocumento tipoDocumento) {
        return Optional.of(jpaTipoDocumentoDao.save(tipoDocumento.toEntity()).toDomain());
    }

}
