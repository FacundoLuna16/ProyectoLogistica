package com.siglo21.swiftlogix.domain.Model;


import com.siglo21.swiftlogix.infrastructure.entity.EstadoHojaEntity;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public abstract class EstadoHoja {
    protected Long id;
    protected String nombre;

    public abstract EstadoHojaEntity toEntity();
}
