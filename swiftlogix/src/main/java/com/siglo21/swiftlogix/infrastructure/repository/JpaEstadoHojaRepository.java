package com.siglo21.swiftlogix.infrastructure.repository;

import com.siglo21.swiftlogix.domain.Model.EstadoHoja;
import com.siglo21.swiftlogix.domain.Repository.EstadoHojaRepository;
import com.siglo21.swiftlogix.infrastructure.dao.JpaEstadoHojaDao;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoHojaEntity;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class JpaEstadoHojaRepository implements EstadoHojaRepository {

    private final JpaEstadoHojaDao jpaEstadoHojaDao;

    public JpaEstadoHojaRepository(JpaEstadoHojaDao jpaEstadoHojaDao) {
        this.jpaEstadoHojaDao = jpaEstadoHojaDao;
    }

    @Override
    public List<EstadoHoja> getAll() {
        return jpaEstadoHojaDao.findAll().stream().map(EstadoHojaEntity::toDomain).toList();
    }

    @Override
    public Optional<EstadoHoja> getById(int idEstadoHoja) {
        return jpaEstadoHojaDao.findById(idEstadoHoja).map(EstadoHojaEntity::toDomain);
    }

    @Override
    public Optional<EstadoHoja> save(EstadoHoja estadoHoja) {
        return Optional.of(jpaEstadoHojaDao.save(estadoHoja.toEntity()).toDomain());
    }
}
