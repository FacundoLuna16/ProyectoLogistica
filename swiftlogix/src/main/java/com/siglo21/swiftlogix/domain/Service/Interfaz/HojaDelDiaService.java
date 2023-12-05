package com.siglo21.swiftlogix.domain.Service.Interfaz;

import com.siglo21.swiftlogix.domain.Model.HojaDelDia;

import java.util.List;

public interface HojaDelDiaService {

    public List<HojaDelDia> getAll();

    public void generarHojaDelDia();

    public void cerrarHojaDelDia(Integer idHojaDelDia, List<Integer> idsEnviosEntregados);

    public void iniciarEntrega(Integer idHojaDelDia);



}
