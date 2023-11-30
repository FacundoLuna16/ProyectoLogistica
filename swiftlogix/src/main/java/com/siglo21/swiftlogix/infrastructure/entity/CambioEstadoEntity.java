package com.siglo21.swiftlogix.infrastructure.entity;

import com.siglo21.swiftlogix.domain.Model.CambioEstado;
import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;


@Entity
@Data
@Table(name = "CambiosEstado")
@RequiredArgsConstructor
public class CambioEstadoEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_cambio_estado")
    private Integer idCambio;


    @Column(name = "fecha_hora_inicio")
    private LocalDateTime fechaHoraInicio;

    @Column(name = "fecha_hora_fin")
    private LocalDateTime fechaHoraFin;

    @ManyToOne
    @JoinColumn(name = "estado_id")
    private EstadoEnvioEntity estado;

    public CambioEstado toDomain() {
        CambioEstado cambioEstado = new CambioEstado();
        cambioEstado.setIdCambio(this.idCambio);
        cambioEstado.setFechaHoraInicio(this.fechaHoraInicio);
        cambioEstado.setFechaHoraFin(this.fechaHoraFin);
        cambioEstado.setEstado(this.estado);
        return cambioEstado;
    }

}
