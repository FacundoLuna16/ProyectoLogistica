package com.siglo21.swiftlogix.infrastructure.repository;

import com.siglo21.swiftlogix.domain.Model.HojaDelDiaExepcional;
import com.siglo21.swiftlogix.domain.Repository.HojaDelDiaExepcionalRepository;
import com.siglo21.swiftlogix.infrastructure.dao.JpaHojaDelDiaExepcionalDao;
import com.siglo21.swiftlogix.infrastructure.entity.HojaDelDiaExepcionalEntity;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Component
public class JpaHojaDelDiaExepcionalRepository implements HojaDelDiaExepcionalRepository {

    private final JpaHojaDelDiaExepcionalDao jpaHojaDelDiaExepcionalDao;

    public JpaHojaDelDiaExepcionalRepository(JpaHojaDelDiaExepcionalDao jpaHojaDelDiaExepcionalDao) {
        this.jpaHojaDelDiaExepcionalDao = jpaHojaDelDiaExepcionalDao;
    }


    @Override
    public List<HojaDelDiaExepcional> getAll() {
        return jpaHojaDelDiaExepcionalDao.findAll().stream().map(HojaDelDiaExepcionalEntity::toDomain).toList();
    }

    @Override
    public Optional<HojaDelDiaExepcional> getById(int idEstadoHoja) {
        return jpaHojaDelDiaExepcionalDao.findById(idEstadoHoja).map(HojaDelDiaExepcionalEntity::toDomain);
    }

    @Override
    public Optional<HojaDelDiaExepcional> save(HojaDelDiaExepcional hojaDelDiaExepcional) {

        HojaDelDiaExepcionalEntity hojaDelDiaExepcionalEntity = hojaDelDiaExepcional.toEntity();
        HojaDelDiaExepcionalEntity hojaDelDiaExepcionalEntity1 = jpaHojaDelDiaExepcionalDao.saveAndFlush(hojaDelDiaExepcionalEntity);
        HojaDelDiaExepcional hojaDelDiaExepcional1 = hojaDelDiaExepcionalEntity1.toDomain();
        return Optional.of(hojaDelDiaExepcional1);

    }

    @Override
    public Optional<HojaDelDiaExepcional> getByFechaReparto(LocalDate fechaReparto) {
        HojaDelDiaExepcionalEntity hojaDelDiaExepcionalEntity = jpaHojaDelDiaExepcionalDao.findByFechaReparto(fechaReparto);
        return Optional.ofNullable(hojaDelDiaExepcionalEntity.toDomain());
    }

}
