package com.siglo21.swiftlogix.infrastructure.repository;

import com.siglo21.swiftlogix.domain.Model.HojaDelDia;
import com.siglo21.swiftlogix.domain.Repository.HojaDelDiaRepository;
import com.siglo21.swiftlogix.infrastructure.dao.JpaHojaDelDiaDao;
import com.siglo21.swiftlogix.infrastructure.entity.HojaDelDiaEntity;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class JpaHojaDelDiaRepository implements HojaDelDiaRepository {

    //TODO implementar
    private final JpaHojaDelDiaDao jpaHojaDelDiaDao;

    public JpaHojaDelDiaRepository(JpaHojaDelDiaDao jpaHojaDelDiaDao) {
        this.jpaHojaDelDiaDao = jpaHojaDelDiaDao;
    }

    @Override
    public List<HojaDelDia> getAll() {
        return jpaHojaDelDiaDao.findAll().stream().map(HojaDelDiaEntity::toDomain).toList();
    }

    @Override
    public Optional<HojaDelDia> getById(int hojaDelDiaId) {
        return jpaHojaDelDiaDao.findById(hojaDelDiaId).map(HojaDelDiaEntity::toDomain);
    }

    @Override
    public Optional<HojaDelDia> save(HojaDelDia hojaDelDia) {
        HojaDelDiaEntity prueba = hojaDelDia.toEntity();
        HojaDelDiaEntity hojaDelDiaEntity = jpaHojaDelDiaDao.saveAndFlush(prueba);
        HojaDelDia hojaDelDia1 = hojaDelDiaEntity.toDomain();
        return Optional.of(hojaDelDia1);
    }

}
