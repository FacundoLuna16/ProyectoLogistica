package com.siglo21.swiftlogix.infrastructure.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Entity
@Data
@RequiredArgsConstructor
public class TipoDocumentoEntity {

        //
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "id_tipo_documento")
        private Integer idTipoDocumento;

        @Column(name = "descripcion")
        private String descripcion;
}
