package com.siglo21.swiftlogix.infrastructure.Configuration;

import com.siglo21.swiftlogix.domain.Repository.*;
import com.siglo21.swiftlogix.domain.Service.*;
import com.siglo21.swiftlogix.domain.Service.Interfaz.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class BeanConfiguration {
    @Bean
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**")
                        .allowedOrigins("*")
                        .allowedMethods("*")
                        .allowedHeaders("*")
                        .allowCredentials(false)
                        .maxAge(3600);
            }
        };
    }
    @Bean
    public ClienteService clienteService(ClienteRepository clienteRepository, TipoDocumentoRepository tipoDocumentoRepository) {
        return new ClienteServiceImpl(clienteRepository, tipoDocumentoRepository);
    }

    @Bean
    public RepartidorService repartidorService(RepartidorRepository repartidorRepository) {
        return new RepartidorServiceImpl(repartidorRepository);
    }

    @Bean
    public EnvioService envioService(EnvioRepository envioRepository, ClienteRepository clienteRepository, EstadoEnvioRepository estadoEnvioRepository, ZonaRepository zonaRepository) {
        return new EnvioServiceImpl(envioRepository, clienteRepository,estadoEnvioRepository , zonaRepository);
    }

    @Bean
    public CamionService camionService(CamionRepository camionRepository) {
        return new CamionServiceImpl(camionRepository);
    }

    @Bean
    public HojaDelDiaService hojaDelDiaService(EnvioRepository envioRepository, HojaDelDiaRepository hojaDelDiaRepository, EstadoHojaRepository estadoHojaRepository, EstadoEnvioRepository estadoEnvioRepository){
        return new HojaDelDiaServiceImpl(envioRepository,hojaDelDiaRepository,estadoHojaRepository, estadoEnvioRepository);
    }

}
