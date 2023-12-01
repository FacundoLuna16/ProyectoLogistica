package com.siglo21.swiftlogix.infrastructure.Configuration;

import com.siglo21.swiftlogix.domain.Repository.*;
import com.siglo21.swiftlogix.domain.Service.DomainClienteServiceImpl;
import com.siglo21.swiftlogix.domain.Service.DomainEnvioServiceImpl;
import com.siglo21.swiftlogix.domain.Service.DomainRepartidorServiceImpl;
import com.siglo21.swiftlogix.domain.Service.Interfaz.ClienteService;
import com.siglo21.swiftlogix.domain.Service.Interfaz.EnvioService;
import com.siglo21.swiftlogix.domain.Service.Interfaz.RepartidorService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BeanConfiguration {

    @Bean
    public ClienteService clienteService(ClienteRepository clienteRepository, TipoDocumentoRepository tipoDocumentoRepository) {
        return new DomainClienteServiceImpl(clienteRepository, tipoDocumentoRepository);
    }

    @Bean
    public RepartidorService repartidorService(RepartidorRepository repartidorRepository) {
        return new DomainRepartidorServiceImpl(repartidorRepository);
    }

    @Bean
    public EnvioService envioService(EnvioRepository envioRepository, ClienteRepository clienteRepository, CamionRepository camionRepository, ZonaRepository zonaRepository) {
        return new DomainEnvioServiceImpl(envioRepository, clienteRepository, camionRepository, zonaRepository);
    }
}
