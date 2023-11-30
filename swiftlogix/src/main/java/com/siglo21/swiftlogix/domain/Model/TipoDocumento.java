package com.siglo21.swiftlogix.domain.Model;


import com.siglo21.swiftlogix.infrastructure.entity.TipoDocumentoEntity;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Service;

@Getter
@Setter
@RequiredArgsConstructor
@NoArgsConstructor
public class TipoDocumento {
    private Integer idTipoDocumento;
    private String descripcion;

    public TipoDocumentoEntity toEntity() {
        TipoDocumentoEntity entity = new TipoDocumentoEntity();
        entity.setIdTipoDocumento(this.idTipoDocumento);
        entity.setDescripcion(this.descripcion);
        return entity;
    }
}
