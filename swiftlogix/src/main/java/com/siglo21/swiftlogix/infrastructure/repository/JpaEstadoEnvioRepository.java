package com.siglo21.swiftlogix.infrastructure.repository;

import com.siglo21.swiftlogix.domain.Model.EstadoEnvio;
import com.siglo21.swiftlogix.domain.Repository.EstadoEnvioRepository;
import com.siglo21.swiftlogix.infrastructure.dao.JpaEstadoEnvioDao;
import com.siglo21.swiftlogix.infrastructure.entity.EstadoEnvioEntity;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class JpaEstadoEnvioRepository implements EstadoEnvioRepository {

    private final JpaEstadoEnvioDao jpaEstadoEnvioDao;

    public JpaEstadoEnvioRepository(JpaEstadoEnvioDao jpaEstadoEnvioDao) {
        this.jpaEstadoEnvioDao = jpaEstadoEnvioDao;
    }


    @Override
    public List<EstadoEnvio> getAll() {
        return jpaEstadoEnvioDao.findAll().stream().map(EstadoEnvioEntity::toDomain).toList();
    }

    @Override
    public Optional<EstadoEnvio> getById(int idEstadoEnvio) {
        return jpaEstadoEnvioDao.findById(idEstadoEnvio).map(EstadoEnvioEntity::toDomain);
    }

    @Override
    public Optional<EstadoEnvio> save(EstadoEnvio estadoEnvio) {
        return Optional.of(jpaEstadoEnvioDao.save(estadoEnvio.toEntity()).toDomain());
    }
}
