package com.siglo21.swiftlogix.domain.Service;

import com.siglo21.swiftlogix.application.request.CamionRequestDto;
import com.siglo21.swiftlogix.domain.Model.Camion;
import com.siglo21.swiftlogix.domain.Repository.CamionRepository;
import com.siglo21.swiftlogix.domain.Service.Interfaz.CamionService;

import java.util.List;
import java.util.Optional;

public class CamionServiceImpl implements CamionService {

    private final CamionRepository camionRepository;

    public CamionServiceImpl(CamionRepository camionRepository) {
        this.camionRepository = camionRepository;
    }


    @Override
    public List<Camion> getAll() {
        return camionRepository.getAll();
    }

    @Override
    public Optional<Camion> getById(String patenteCamion) {
        return camionRepository.getById(patenteCamion);
    }

    @Override
    public Optional<Camion> save(CamionRequestDto camion) {
        Optional<Camion> camionNoPresent = camionRepository.getById(camion.getPatente());
        if (camionNoPresent.isPresent()) {
            throw new RuntimeException("Camion ya existe");
        }
        Camion camionSave = new Camion(camion);
        return camionRepository.save(camionSave);
    }

    @Override
    public Optional<Camion> update(String patenteCamion, CamionRequestDto camionRequestDto) {
        Optional<Camion> camion = camionRepository.getById(patenteCamion);
        if (camion.isEmpty()) {
            throw new RuntimeException("Camion no existe");
        }
        Camion camionUpdate = new Camion(camionRequestDto);

        return camionRepository.save(camionUpdate);
    }
}
