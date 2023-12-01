package com.siglo21.swiftlogix.infrastructure.entity;

import com.siglo21.swiftlogix.domain.Model.DetalleEnvio;
import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Entity
@Data
@Table(name = "DetallesEnvios")
@RequiredArgsConstructor
public class DetalleEnvioEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_detalle_envio")
    private Integer id;

    @Column(name = "nombre")
    private String nombre;



    public DetalleEnvio toDomain() {
        DetalleEnvio domain = new DetalleEnvio();
        domain.setId(this.id);
        domain.setNombre(this.nombre);
        return domain;
    }
}
