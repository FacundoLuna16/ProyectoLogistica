package com.siglo21.swiftlogix.domain.Service.Interfaz;

import com.siglo21.swiftlogix.application.request.ClienteRequestDto;
import com.siglo21.swiftlogix.domain.Model.Cliente;

import java.util.List;
import java.util.Optional;

public interface ClienteService {

    List<Cliente> getAll();

    Optional<Cliente> getById(int clienteId);

    Optional<Cliente> save(ClienteRequestDto cliente);

    Optional<Cliente> update(int clienteId, ClienteRequestDto clienteRequestDto);

}
