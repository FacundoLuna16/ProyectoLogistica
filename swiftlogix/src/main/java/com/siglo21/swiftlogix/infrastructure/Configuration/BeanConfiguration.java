package com.siglo21.swiftlogix.infrastructure.Configuration;

import com.siglo21.swiftlogix.domain.Repository.ClienteRepository;
import com.siglo21.swiftlogix.domain.Repository.TipoDocumentoRepository;
import com.siglo21.swiftlogix.domain.Service.DomainClienteServiceImpl;
import com.siglo21.swiftlogix.domain.Service.Interfaz.ClienteService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BeanConfiguration {

    @Bean
    public ClienteService clienteService(ClienteRepository clienteRepository, TipoDocumentoRepository tipoDocumentoRepository) {
        return new DomainClienteServiceImpl(clienteRepository, tipoDocumentoRepository);
    }

}
