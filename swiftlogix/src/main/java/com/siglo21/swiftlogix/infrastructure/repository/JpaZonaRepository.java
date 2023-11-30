package com.siglo21.swiftlogix.infrastructure.repository;

import com.siglo21.swiftlogix.domain.Model.Zona;
import com.siglo21.swiftlogix.infrastructure.entity.ZonaEntity;
import com.siglo21.swiftlogix.domain.Repository.ZonaRepository;
import com.siglo21.swiftlogix.infrastructure.dao.JpaZonaDao;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class JpaZonaRepository implements ZonaRepository {

    public JpaZonaDao jpaZonaDao;

    public JpaZonaRepository(JpaZonaDao jpaZonaDao){
        this.jpaZonaDao=jpaZonaDao;
    }

    @Override
    public List<Zona> getAll() {
        return jpaZonaDao.findAll().stream().map(ZonaEntity::toDomain).toList();
    }

    @Override
    public Optional<Zona> getById(int zonaId) {
        return jpaZonaDao.findById(zonaId).map(ZonaEntity::toDomain);
    }

    @Override
    public Optional<Zona> save(Zona zona) {
        return Optional.of(jpaZonaDao.save(zona.toEntity()).toDomain());
    }

}
