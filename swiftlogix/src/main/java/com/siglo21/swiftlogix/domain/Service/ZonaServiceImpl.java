package com.siglo21.swiftlogix.domain.Service;

import com.siglo21.swiftlogix.domain.Model.Zona;
import com.siglo21.swiftlogix.domain.Repository.ZonaRepository;
import com.siglo21.swiftlogix.domain.Service.Interfaz.ZonaService;

import java.util.List;

public class ZonaServiceImpl implements ZonaService {

    private final ZonaRepository zonaRepository;

    public ZonaServiceImpl(ZonaRepository zonaRepository) {
        this.zonaRepository = zonaRepository;
    }

    @Override
    public List<Zona> getAll() {
        return zonaRepository.getAll();
    }
}
