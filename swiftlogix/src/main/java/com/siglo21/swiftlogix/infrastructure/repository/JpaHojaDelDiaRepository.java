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

    private final JpaHojaDelDiaDao hojaDelDiaDao;

    public JpaHojaDelDiaRepository(JpaHojaDelDiaDao hojaDelDiaDao) {
        this.hojaDelDiaDao = hojaDelDiaDao;
    }

    @Override
    public List<HojaDelDia> findAll() {

        List<HojaDelDiaEntity> hojaDelDias = hojaDelDiaDao.findAll();

        return null;//hojaDelDias.stream().map(HojaDelDiaEntity::toHojaDelDia).toList();
    }

    @Override
    public Optional<HojaDelDia> getById(int hojaDelDiaId) {
        return Optional.empty();
    }

    @Override
    public Optional<HojaDelDia> save(HojaDelDia hojaDelDia) {
        return Optional.empty();
    }

    @Override
    public Optional<HojaDelDia> update(HojaDelDia hojaDelDia) {
        return Optional.empty();
    }
}
