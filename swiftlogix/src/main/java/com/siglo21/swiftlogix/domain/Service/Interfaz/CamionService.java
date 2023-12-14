package com.siglo21.swiftlogix.domain.Service.Interfaz;

import com.siglo21.swiftlogix.application.request.CamionCrearRequestDto;
import com.siglo21.swiftlogix.application.request.CamionRequestDto;
import com.siglo21.swiftlogix.application.request.ClienteRequestDto;
import com.siglo21.swiftlogix.domain.Model.Camion;
import com.siglo21.swiftlogix.domain.Model.Cliente;

import java.util.List;
import java.util.Optional;

public interface CamionService {
    List<Camion> getAll();

    Optional<Camion> getById(String patenteCamion);

    Optional<Camion> save(CamionCrearRequestDto camionRequestDto);

    Optional<Camion> update(String patenteCamion, CamionRequestDto camionRequestDto);
}
