package com.siglo21.swiftlogix.infrastructure.Configuration.swagger;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.security.OAuthFlow;
import io.swagger.v3.oas.models.security.OAuthFlows;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springframework.stereotype.Component;

@Component
public class SecurityTokenCustomizer{

//    @Override
//    public void customise(OpenAPI openApi) {
//        // Obtener el token dinámicamente (puedes implementar la lógica según tus necesidades)
//        String token = obtenerTokenDinamicamente();
//
//        // Actualizar el valor del token en la configuración de la interfaz Swagger
//        openApi.getComponents().getSecuritySchemes().get("bearerAuth")
//                .bearerFormat(token);
//    }
//
//    private String obtenerTokenDinamicamente() {
//        // Implementa la lógica para obtener el token de manera dinámica
//        // Puedes utilizar tu lógica actual para obtener el token aquí
//        // ...
//
//        return "TOKEN_ACTUALIZADO";
//    }
}

