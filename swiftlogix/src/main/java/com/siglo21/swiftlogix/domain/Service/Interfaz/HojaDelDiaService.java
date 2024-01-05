package com.siglo21.swiftlogix.domain.Service.Interfaz;

import com.siglo21.swiftlogix.domain.Model.HojaDelDia;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

public interface HojaDelDiaService {

    List<HojaDelDia> getAll();

    void generarHojaDelDia();

    void cerrarHojaDelDia(Integer idHojaDelDia, List<String> idsEnviosEntregados);

    void iniciarEntrega(Integer idHojaDelDia);

    HojaDelDia getHojaDelDia(LocalDate idHojaDelDia);

    List<HojaDelDia> getHojaDelDiaSemanal(LocalDate fechaReparto);

    void enviarMensaje(List<String> numeros);




}
