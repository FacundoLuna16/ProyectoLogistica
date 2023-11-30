package com.siglo21.swiftlogix.infrastructure.repository;

import com.siglo21.swiftlogix.domain.Model.Camion;
import com.siglo21.swiftlogix.domain.Repository.CamionRepository;
import com.siglo21.swiftlogix.infrastructure.dao.JpaCamionDao;
import com.siglo21.swiftlogix.infrastructure.entity.CamionEntity;

import java.util.List;
import java.util.Optional;

public class JpaCamionRepository implements CamionRepository {

    public final JpaCamionDao jpaCamionDao;

    public JpaCamionRepository(JpaCamionDao jpaCamionDao) {
        this.jpaCamionDao = jpaCamionDao;
    }
    @Override
    public List<Camion> getAll() {
        return jpaCamionDao.findAll().stream().map(CamionEntity::toDomain).toList();
    }

    @Override
    public Optional<Camion> getById(int camionId) {
        return jpaCamionDao.findById(camionId).map(CamionEntity::toDomain);
    }

    @Override
    public Optional<Camion> save(Camion camion) {
        return Optional.of(jpaCamionDao.save(camion.toEntity()).toDomain());
    }
}
