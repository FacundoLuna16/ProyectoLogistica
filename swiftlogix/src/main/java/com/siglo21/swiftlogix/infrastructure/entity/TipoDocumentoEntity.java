package com.siglo21.swiftlogix.infrastructure.entity;

import com.siglo21.swiftlogix.domain.Model.TipoDocumento;
import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Entity
@Data
@Table(name = "TiposDocumentos")
@RequiredArgsConstructor
public class TipoDocumentoEntity {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "id_tipo_documento")
        private Integer idTipoDocumento;

        @Column(name = "descripcion")
        private String descripcion;

        public TipoDocumento toDomain() {
                TipoDocumento tipoDocumento = new TipoDocumento();
                tipoDocumento.setIdTipoDocumento(this.idTipoDocumento);
                tipoDocumento.setDescripcion(this.descripcion);
                return tipoDocumento;
        }
}
