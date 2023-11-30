package com.siglo21.swiftlogix.infrastructure.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;


@Entity
@Data
@RequiredArgsConstructor
public class CambioEstadoEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_cambio_estado")
    private Long idCambio;


    @Column(name = "fecha_hora_inicio")
    private LocalDateTime fechaHoraInicio;

    @Column(name = "fecha_hora_fin")
    private LocalDateTime fechaHoraFin;

    @ManyToOne
    @JoinColumn(name = "envio_numero_factura")
    private EnvioEntity envio;

    @ManyToOne
    @JoinColumn(name = "estado_id")
    private EstadoEnvioEntity estado;

}
