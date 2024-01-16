package com.siglo21.swiftlogix.domain.Service.Interfaz;

import com.siglo21.swiftlogix.domain.Model.HojaDelDiaExepcional;

import java.time.LocalDate;
import java.util.List;

public interface HojaDelDiaExepcionalService {
    List<HojaDelDiaExepcional> getAll();

    HojaDelDiaExepcional getHojaDelDia(LocalDate fechaReparto);

    HojaDelDiaExepcional generarHojaDelDia(List<String> idsEnvios, LocalDate fechaReparto, String idCamion, Integer idRepartidor);
}
