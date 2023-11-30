package com.siglo21.swiftlogix.infrastructure.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Entity
@Data
@RequiredArgsConstructor
public class TipoDocumentoEntity {

        //
        @Id
        @Column(name = "id_tipo_documento")
        private Integer idTipoDocumento;

        @Column(name = "descripcion")
        private String descripcion;
}
