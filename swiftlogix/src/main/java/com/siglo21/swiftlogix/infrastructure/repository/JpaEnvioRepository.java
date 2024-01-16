package com.siglo21.swiftlogix.infrastructure.repository;

import com.siglo21.swiftlogix.domain.Model.Envio;
import com.siglo21.swiftlogix.domain.Repository.EnvioRepository;
import com.siglo21.swiftlogix.infrastructure.dao.JpaEnvioDao;
import com.siglo21.swiftlogix.infrastructure.entity.EnvioEntity;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

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
    public List<Envio> getAllFiltradoGenerarHoja(Integer idEstado, Integer idZona) {
        List<EnvioEntity> envioDeZonaEntities = jpaEnvioDao.findAllFilteredWithIntentos(idEstado, idZona);
        List<EnvioEntity> envioExternosEntities = jpaEnvioDao.findAllEnviosExternos();

        Set<EnvioEntity> enviosSet = new HashSet<>(envioDeZonaEntities);
        enviosSet.addAll(envioExternosEntities);

        return enviosSet.stream()
                .map(EnvioEntity::toDomain)
                .toList();
    }


    @Override
    public Optional<Envio> getById(String envioId) {
        Optional<EnvioEntity> envioEntity = jpaEnvioDao.findById(envioId);
        if (envioEntity.isEmpty()) {
            throw new RuntimeException("Envío no encontrado");
        }
        return envioEntity.map(EnvioEntity::toDomain);
    }

    @Override
    public Optional<Envio> getByNroFacturaNoExiste(String nroFactura) {
        // Buscar un EnvioEntity por el número de factura utilizando el JPA repository
        Optional<EnvioEntity> envioEntity = jpaEnvioDao.findById(nroFactura);

        // Verificar si se encontró un EnvioEntity con el número de factura dado
        if (envioEntity.isEmpty()) {
            // Si no se encuentra, mapear el EnvioEntity a un objeto de dominio Envio y devolverlo opcionalmente
            return envioEntity.map(EnvioEntity::toDomain);
        }

        // Si ya existe un EnvioEntity con el mismo número de factura, lanzar una excepción
        throw new RuntimeException("El numero de factura ya esta registrado");
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

    @Override
    public Optional<Envio> getByNroFactura(String nroFactura) {
        Optional<EnvioEntity> envioEntity = jpaEnvioDao.findById(nroFactura);
        if (envioEntity.isEmpty()) {
            throw new RuntimeException("Envío no encontrado");
        }
        return envioEntity.map(EnvioEntity::toDomain);
    }

    @Override
    public List<Envio> getByNroFacturaList(List<String> nroFactura) {
        List<EnvioEntity> envioEntities = jpaEnvioDao.findAllById(nroFactura);
        if (envioEntities.isEmpty()) {
            throw new RuntimeException("Envios no encontrado");
        }
        return envioEntities.stream().map(EnvioEntity::toDomain).toList();
    }
}
