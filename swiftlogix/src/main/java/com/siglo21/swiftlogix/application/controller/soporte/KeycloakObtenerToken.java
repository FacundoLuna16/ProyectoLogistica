package com.siglo21.swiftlogix.application.controller.soporte;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/api/v1/keycloak")
public class KeycloakObtenerToken {

    private static final String TOKEN_ENDPOINT = "http://localhost:8180/auth/realms/siglo21/protocol/openid-connect/token";

    @CrossOrigin
    @GetMapping("/obtener-token")
    @ResponseBody
    public String obtenerToken(@RequestParam String username, @RequestParam String password) {
        // Configurar el encabezado de la solicitud
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        // Configurar el cuerpo (body) de la solicitud
        MultiValueMap<String, String> map= new LinkedMultiValueMap<>();
        map.add("client_id", "siglo21-client-api-rest");
        map.add("grant_type", "password");
        map.add("username", username);
        map.add("password", password);
        map.add("client_secret", "DuXMmJE5ClpWLFZvYW0epQydZowD9msw");

        // Realizar la solicitud POST
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<?> response = restTemplate.postForEntity(TOKEN_ENDPOINT, map, responseKeycloak.class);
        String token = ((responseKeycloak) response.getBody()).getAccess_token();
        return token;
    }
}
