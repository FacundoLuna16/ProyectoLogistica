package com.siglo21.swiftlogix.infrastructure.repository;

import com.siglo21.swiftlogix.domain.Model.Repartidor;
import com.siglo21.swiftlogix.domain.Repository.RepartidorRepository;
import com.siglo21.swiftlogix.infrastructure.dao.JpaRepartidoresDao;
import com.siglo21.swiftlogix.infrastructure.entity.RepartidorEntity;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class JpaRepartidorRepository implements RepartidorRepository {

    public final JpaRepartidoresDao jpaRepartidoresDao;

    public JpaRepartidorRepository(JpaRepartidoresDao jpaRepartidoresDao) {
        this.jpaRepartidoresDao = jpaRepartidoresDao;
    }

    @Override
    public List<Repartidor> getAll() {
        return jpaRepartidoresDao.findAll().stream().map(RepartidorEntity::toDomain).toList();
    }

    @Override
    public Optional<Repartidor> getById(int repartidorId) {
        Optional<RepartidorEntity> repartidorEntity = jpaRepartidoresDao.findById(repartidorId);
        if (repartidorEntity.isEmpty()) {
            throw new RuntimeException("Repartidor no existe");
        }
        return repartidorEntity.map(RepartidorEntity::toDomain);
    }

    @Override
    public Optional<Repartidor> save(Repartidor repartidor) {
        return Optional.of(jpaRepartidoresDao.save(repartidor.toEntity()).toDomain());
    }
}
