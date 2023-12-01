package com.siglo21.swiftlogix.domain.Service.Interfaz;

import com.siglo21.swiftlogix.application.Response.RepartidorResponse;
import com.siglo21.swiftlogix.application.request.RepartidorRequestDto;
import com.siglo21.swiftlogix.domain.Model.Repartidor;

import java.util.List;
import java.util.Optional;

public interface RepartidorService {
    List<Repartidor> getAll();

    Optional<Repartidor> getById(int repartidorId);

    Optional<Repartidor> save(RepartidorRequestDto repartidorResponse);

    Optional<Repartidor> update(int repartidorId, RepartidorRequestDto repartidorRequestDto);

}
