package com.siglo21.swiftlogix.infrastructure.repository;

import com.siglo21.swiftlogix.domain.Model.Cliente;
import com.siglo21.swiftlogix.domain.Repository.ClienteRepository;
import com.siglo21.swiftlogix.infrastructure.dao.JpaClienteDao;
import com.siglo21.swiftlogix.infrastructure.entity.ClienteEntity;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class JpaClienteRepository implements ClienteRepository {

    public final JpaClienteDao jpaClienteDao;

    public JpaClienteRepository (JpaClienteDao jpaClienteDao){
        this.jpaClienteDao = jpaClienteDao;
    }

    @Override
    public List<Cliente> getAll() {
        return jpaClienteDao.findAll().stream().map(ClienteEntity::toDomain).toList();
    }

    @Override
    public Optional<Cliente> getById(int clienteId) {
        return jpaClienteDao.findById(clienteId).map(ClienteEntity::toDomain);
    }

    @Override
    public Optional<Cliente> save(Cliente cliente) {
        try {
            return Optional.of(jpaClienteDao.save(cliente.toEntity()).toDomain());
        }catch (Exception e){
            throw new RuntimeException("Error al guardar el cliente");
        }
    }

}
