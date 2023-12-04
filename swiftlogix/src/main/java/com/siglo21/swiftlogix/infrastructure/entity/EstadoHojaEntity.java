package com.siglo21.swiftlogix.infrastructure.entity;

import com.siglo21.swiftlogix.domain.Model.EstadoHoja;
import com.siglo21.swiftlogix.domain.Model.EstadoHojaDelDia.DeCamino;
import com.siglo21.swiftlogix.domain.Model.EstadoHojaDelDia.EnPreparacion;
import com.siglo21.swiftlogix.domain.Model.EstadoHojaDelDia.Realizado;
import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Entity
@Data
@Table(name = "EstadosHoja")
@RequiredArgsConstructor
public class EstadoHojaEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Integer id;
    protected String nombre;

    public EstadoHojaEntity(Integer id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    public EstadoHoja toDomain(){
        switch (this.id){
            case 2:
                return new DeCamino(this.id, this.nombre);
            case 3:
                return new Realizado(this.id, this.nombre);
            default:
                return new EnPreparacion(this.id, this.nombre);
        }
    };
}
