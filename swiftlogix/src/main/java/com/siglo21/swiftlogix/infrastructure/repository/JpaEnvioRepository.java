package com.siglo21.swiftlogix.infrastructure.repository;

import com.siglo21.swiftlogix.domain.Model.Envio;
import com.siglo21.swiftlogix.domain.Repository.EnvioRepository;
import com.siglo21.swiftlogix.infrastructure.dao.JpaEnvioDao;
import com.siglo21.swiftlogix.infrastructure.entity.EnvioEntity;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class JpaEnvioRepository implements EnvioRepository {

    public final JpaEnvioDao jpaEnvioDao;

    public JpaEnvioRepository(JpaEnvioDao jpaEnvioDao) {
        this.jpaEnvioDao = jpaEnvioDao;
    }


    @Override
    public List<Envio> getAll() {
        return jpaEnvioDao.findAll().stream().map(EnvioEntity::toDomain).toList();
    }

    @Override
    public Optional<Envio> getById(int envioId) {
        return Optional.empty();
    }

    @Override
    public Optional<Envio> save(Envio envio) {
        //TODO problemas con el mapeo, guarda bien en la base de datos pero no devuelve el objeto correctamente
        EnvioEntity prueba = envio.toEntity();
        EnvioEntity envioEntity = jpaEnvioDao.save(prueba);
        Envio envio1 = envioEntity.toDomain();
        return Optional.of(envio1);
    }
}
