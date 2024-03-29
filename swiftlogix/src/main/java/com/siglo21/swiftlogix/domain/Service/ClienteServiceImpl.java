package com.siglo21.swiftlogix.domain.Service;

import com.siglo21.swiftlogix.application.request.ClienteRequestDto;
import com.siglo21.swiftlogix.domain.Model.Cliente;
import com.siglo21.swiftlogix.domain.Model.TipoDocumento;
import com.siglo21.swiftlogix.domain.Repository.ClienteRepository;
import com.siglo21.swiftlogix.domain.Repository.TipoDocumentoRepository;
import com.siglo21.swiftlogix.domain.Service.Interfaz.ClienteService;
import jakarta.transaction.Transactional;

import java.util.List;
import java.util.Optional;

public class ClienteServiceImpl implements ClienteService {

    private final ClienteRepository clienteRepository;
    private final TipoDocumentoRepository tipoDocumentoRepository;

    public ClienteServiceImpl(ClienteRepository clienteRepository, TipoDocumentoRepository tipoDocumentoRepository) {
        this.clienteRepository = clienteRepository;
        this.tipoDocumentoRepository = tipoDocumentoRepository;
    }
    @Override
    public List<Cliente> getAll() {
        return clienteRepository.getAll();
    }

    @Override
    public Optional<Cliente> getById(int clienteId) {
        Optional<Cliente> cliente = clienteRepository.getById(clienteId);
        if (cliente.isEmpty()) {
            throw new RuntimeException("Cliente no encontrado");
        }
        return cliente;
    }

    @Override
    @Transactional
    public Optional<Cliente> save(ClienteRequestDto clienteRequestDto) {
        TipoDocumento tipoDocumento = tipoDocumentoRepository.getById(clienteRequestDto.getIdTipoDocumento()).get();
        Cliente cliente = new Cliente(tipoDocumento,clienteRequestDto);
        return clienteRepository.save(cliente);
    }

    public Optional<Cliente> update(int clienteId, ClienteRequestDto clienteRequestDto) {
        Cliente cliente = this.getById(clienteId).get();
        TipoDocumento tipoDocumento = tipoDocumentoRepository.getById(clienteRequestDto.getIdTipoDocumento()).get();
        cliente.setTipoDocumento(tipoDocumento);
        cliente.setNumeroDocumento(clienteRequestDto.getNumeroDocumento());
        cliente.setNombre(clienteRequestDto.getNombre());
        cliente.setApellido(clienteRequestDto.getApellido());
        cliente.setDireccion(clienteRequestDto.getDireccion());
        cliente.setNumeroTelefono(clienteRequestDto.getNumeroTelefono());
        cliente.setNumeroTelefonoAlternativo(clienteRequestDto.getNumeroTelefonoAlternativo());
        cliente.setEmail(clienteRequestDto.getEmail());
        return clienteRepository.save(cliente);


    }
}
