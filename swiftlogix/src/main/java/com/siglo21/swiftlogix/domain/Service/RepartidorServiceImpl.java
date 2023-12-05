package com.siglo21.swiftlogix.domain.Service;

import com.siglo21.swiftlogix.application.request.RepartidorRequestDto;
import com.siglo21.swiftlogix.domain.Model.Repartidor;
import com.siglo21.swiftlogix.domain.Repository.RepartidorRepository;
import com.siglo21.swiftlogix.domain.Service.Interfaz.RepartidorService;

import java.util.List;
import java.util.Optional;

public class RepartidorServiceImpl implements RepartidorService {

    private final RepartidorRepository repartidorRepository;

    public RepartidorServiceImpl(RepartidorRepository repartidorRepository) {
        this.repartidorRepository = repartidorRepository;
    }


    @Override
    public List<Repartidor> getAll() {
        return repartidorRepository.getAll();
    }

    @Override
    public Optional<Repartidor> getById(int repartidorId) {
        return repartidorRepository.getById(repartidorId);
    }

    @Override
    public Optional<Repartidor> save(RepartidorRequestDto repartidorResponse) {
        Repartidor repartidor = new Repartidor();
        repartidor.setNombre(repartidorResponse.getNombre());
        repartidor.setApellido(repartidorResponse.getApellido());
        return repartidorRepository.save(repartidor);
    }

    @Override
    public Optional<Repartidor> update(int repartidorId, RepartidorRequestDto repartidorRequestDto) {
        Repartidor repartidorBase = this.getById(repartidorId).get();
        repartidorBase.setNombre(repartidorRequestDto.getNombre());
        repartidorBase.setApellido(repartidorRequestDto.getApellido());
        return repartidorRepository.save(repartidorBase);
    }
}
