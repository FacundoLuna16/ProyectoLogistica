package com.siglo21.swiftlogix.infrastructure.entity;

import com.siglo21.swiftlogix.domain.Model.Cliente;
import jakarta.persistence.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Entity
@Data
@Table(name = "Clientes")
@RequiredArgsConstructor
public class ClienteEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_cliente")
    private Integer idCliente;

    //relacion a tipoDocumento
    @ManyToOne
    @JoinColumn(name = "id_tipo_documento")
    private TipoDocumentoEntity tipoDocumento;

    @Column(name = "numero_documento")
    private String numeroDocumento;


    @Column(name = "nombre")
    private String nombre;

    @Column(name = "apellido")
    private String apellido;

    @Column(name = "direccion")
    private String direccion;

    @Column(name = "numero_telefono")
    private String numeroTelefono;

    @Column(name = "numero_telefono_alternativo")
    private String numeroTelefonoAlternativo;

    @Column(name = "email")
    private String email;

    public Cliente toDomain() {
        Cliente model = new Cliente();
        model.setIdCliente(idCliente);
        model.setTipoDocumento(tipoDocumento.toDomain());
        model.setNumeroDocumento(numeroDocumento);
        model.setNombre(nombre);
        model.setApellido(apellido);
        model.setDireccion(direccion);
        model.setNumeroTelefono(numeroTelefono);
        model.setNumeroTelefonoAlternativo(numeroTelefonoAlternativo);
        model.setEmail(email);
        return model;
    }
}
