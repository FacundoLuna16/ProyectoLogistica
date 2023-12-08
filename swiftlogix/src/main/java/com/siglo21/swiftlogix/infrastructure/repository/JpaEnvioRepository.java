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
    public List<Envio> getAllFiltrado(Integer idEstado, Integer idZona, Integer idCliente) {
        return jpaEnvioDao.findAllFiltered(idEstado,idZona,idCliente).stream().map(EnvioEntity::toDomain).toList();
        // return jpaEnvioDao.findAll().stream().map(EnvioEntity::toDomain).toList();
    }

    @Override
    public Optional<Envio> getById(String envioId) {
        return jpaEnvioDao.findById(envioId).map(EnvioEntity::toDomain);
    }

    @Override
    public Optional<Envio> save(Envio envio) {
        EnvioEntity prueba = envio.toEntity();
        EnvioEntity envioEntity = jpaEnvioDao.save(prueba);
        Envio envio1 = envioEntity.toDomain();
        return Optional.of(envio1);
    }
    //METODO SAVEALL PARA GUARDAR UNA LISTA DE ENVIOS
    @Override
    public List<Envio> saveAll(List<Envio> envios) {
        List<EnvioEntity> envioEntities = envios.stream().map(Envio::toEntity).toList();
        List<EnvioEntity> envioEntities1 = jpaEnvioDao.saveAll(envioEntities);
        return envioEntities1.stream().map(EnvioEntity::toDomain).toList();
    }
}
