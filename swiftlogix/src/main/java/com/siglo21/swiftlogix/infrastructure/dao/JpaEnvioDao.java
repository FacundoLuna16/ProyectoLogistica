package com.siglo21.swiftlogix.infrastructure.dao;

import com.siglo21.swiftlogix.infrastructure.entity.EnvioEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface JpaEnvioDao extends JpaRepository<EnvioEntity, String> {


@Query("SELECT e FROM EnvioEntity e\n" +
        "WHERE \n" +
        "  (:idEstado IS NULL OR e.estadoActual.id = :idEstado) AND\n" +
        "  (:idZona IS NULL OR e.zona.idZona = :idZona) AND\n" +
        "  (:idCliente IS NULL OR e.cliente.idCliente = :idCliente)")
List<EnvioEntity> findAllFiltered(Integer idEstado, Integer idZona, Integer idCliente);

    @Query("SELECT e FROM EnvioEntity e\n" +
            "WHERE \n" +
            "  (:idEstado IS NULL OR e.estadoActual.id = :idEstado) AND\n" +
            "  (:idZona IS NULL OR e.zona.idZona = :idZona) AND\n" +
            "  (:idCliente IS NULL OR e.cliente.idCliente = :idCliente) AND\n" +
            "  (e.envioExterno = true)")
    List<EnvioEntity> findAllFiltered2(Integer idEstado, Integer idZona, Integer idCliente);

}
