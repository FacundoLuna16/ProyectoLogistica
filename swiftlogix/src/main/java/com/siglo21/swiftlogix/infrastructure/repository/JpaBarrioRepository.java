package com.siglo21.swiftlogix.infrastructure.repository;

import com.siglo21.swiftlogix.domain.Model.Barrio;
import com.siglo21.swiftlogix.infrastructure.entity.BarrioEntity;
import com.siglo21.swiftlogix.domain.Repository.BarrioRepository;
import com.siglo21.swiftlogix.infrastructure.dao.JpaBarrioDao;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class JpaBarrioRepository implements BarrioRepository {

    public final JpaBarrioDao jpaBarrioDao;

    public JpaBarrioRepository(JpaBarrioDao jpaBarrioDao){
        this.jpaBarrioDao = jpaBarrioDao;
    }

    @Override
    public List<Barrio> getAll() {
        return jpaBarrioDao.findAll().stream().map(BarrioEntity::toDomain).toList();
    }

    @Override
    public Optional<Barrio> getById(int barrioId) {
        return jpaBarrioDao.findById(barrioId).map(BarrioEntity::toDomain);
    }

    @Override
    public Optional<Barrio> save(Barrio barrio) {
        return Optional.of(jpaBarrioDao.save(barrio.toEntity()).toDomain());
    }

}
