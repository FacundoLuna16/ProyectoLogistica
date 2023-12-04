package com.siglo21.swiftlogix.infrastructure.entity;

import com.siglo21.swiftlogix.domain.Model.EstadoEnvio;
import com.siglo21.swiftlogix.domain.Model.EstadosEnvio.EnCamino;
import com.siglo21.swiftlogix.domain.Model.EstadosEnvio.Entregado;
import com.siglo21.swiftlogix.domain.Model.EstadosEnvio.NoEntregado;
import com.siglo21.swiftlogix.domain.Model.EstadosEnvio.Pendiente;
import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Getter
@Setter
@Table(name = "EstadosEnvio")
@RequiredArgsConstructor
public class EstadoEnvioEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_estado")
    protected Integer id;

    @Column(name = "nombre")
    protected String nombre;

    public EstadoEnvioEntity(Integer id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    public EstadoEnvio toDomain(){
        switch (this.id){
            case 1:
                return new Pendiente(this.id, this.nombre);
            case 2:
                return new EnCamino(this.id, this.nombre);
            case 3:
                return new NoEntregado(this.id, this.nombre);
            default:
                return new Entregado(this.id, this.nombre);
        }
    }

}
