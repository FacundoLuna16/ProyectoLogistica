package com.siglo21.swiftlogix.domain.Repository;


import com.siglo21.swiftlogix.domain.Model.Cliente;

import java.util.List;
import java.util.Optional;

public interface ClienteRepository {
    List<Cliente> getAll();

    Optional<Cliente> getById(int clienteId);

    Optional<Cliente> save(Cliente cliente);
}
