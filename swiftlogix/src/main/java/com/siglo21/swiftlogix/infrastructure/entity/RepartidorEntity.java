package com.siglo21.swiftlogix.infrastructure.entity;

import com.siglo21.swiftlogix.domain.Model.Repartidor;
import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.List;

@Entity
@Data
@Table(name = "Repartidores")
@RequiredArgsConstructor
public class RepartidorEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_repartidor")
    private Integer idRepartidor;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "apellido")
    private String apellido;

    public Repartidor toDomain() {
        Repartidor repartidor = new Repartidor();
        repartidor.setIdRepartidor(this.idRepartidor);
        repartidor.setNombre(this.nombre);
        repartidor.setApellido(this.apellido);
        return repartidor;
    }
}
