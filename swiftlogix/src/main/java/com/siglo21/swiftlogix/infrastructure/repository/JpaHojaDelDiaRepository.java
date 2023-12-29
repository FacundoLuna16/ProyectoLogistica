package com.siglo21.swiftlogix.infrastructure.repository;

import com.siglo21.swiftlogix.domain.Model.HojaDelDia;
import com.siglo21.swiftlogix.domain.Repository.HojaDelDiaRepository;
import com.siglo21.swiftlogix.infrastructure.dao.JpaHojaDelDiaDao;
import com.siglo21.swiftlogix.infrastructure.entity.HojaDelDiaEntity;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Component
public class JpaHojaDelDiaRepository implements HojaDelDiaRepository {

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

    @Override
    public Optional<HojaDelDia> getHojaDelDia(LocalDate fechaReparto) {
        // Utiliza el método findByFechaReparto del JpaHojaDelDiaDao para buscar por fecha
        HojaDelDiaEntity hojaDelDiaEntity = jpaHojaDelDiaDao.findByFechaReparto(fechaReparto);

        // Verifica si se encontró la entidad
        if (hojaDelDiaEntity != null) {
            // Convierte la entidad a un objeto de dominio y devuelve un Optional
            return Optional.of(hojaDelDiaEntity.toDomain());
        } else {
            // Si no se encuentra, devuelve un Optional vacío
            return Optional.empty();
        }
    }

    @Override
    public List<HojaDelDia> getHojaDelDiaBetween(LocalDate startDate, LocalDate endDate) {
        List<HojaDelDiaEntity> hojasDelDiaEntities = jpaHojaDelDiaDao.findByFechaRepartoBetween(startDate, endDate);
        return hojasDelDiaEntities.stream()
                .map(HojaDelDiaEntity::toDomain)
                .collect(Collectors.toList());
    }
}