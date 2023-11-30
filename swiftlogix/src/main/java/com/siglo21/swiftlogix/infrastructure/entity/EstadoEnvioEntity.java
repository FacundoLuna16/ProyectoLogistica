package com.siglo21.swiftlogix.infrastructure.entity;

import com.siglo21.swiftlogix.domain.Model.EstadoEnvio;
import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "estado_type")
@Getter
@Setter
@Table(name = "EstadosEnvio")
@RequiredArgsConstructor
public abstract class EstadoEnvioEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_estado")
    protected Long id;

    @Column(name = "nombre")
    protected String nombre;

    public EstadoEnvio toDomain() {
        return null;
    }

}
