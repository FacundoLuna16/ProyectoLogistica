package com.siglo21.swiftlogix.infrastructure.repository;

import com.siglo21.swiftlogix.domain.Model.Camion;
import com.siglo21.swiftlogix.domain.Repository.CamionRepository;
import com.siglo21.swiftlogix.infrastructure.dao.JpaCamionDao;
import com.siglo21.swiftlogix.infrastructure.entity.CamionEntity;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
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
    public Optional<Camion> getById(String patenteCamion) {
        return jpaCamionDao.findById(patenteCamion).map(CamionEntity::toDomain);
    }

    @Override
    public Optional<Camion> save(Camion camion) {
        return Optional.of(jpaCamionDao.save(camion.toEntity()).toDomain());
    }
}
