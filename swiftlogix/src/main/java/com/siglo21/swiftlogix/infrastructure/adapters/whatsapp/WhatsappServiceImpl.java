package com.siglo21.swiftlogix.infrastructure.adapters.whatsapp;

import com.google.i18n.phonenumbers.NumberParseException;
import com.google.i18n.phonenumbers.PhoneNumberUtil;
import com.siglo21.swiftlogix.domain.exchangePort.WhatsappService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest.BodyPublishers;

@Service
public class WhatsappServiceImpl implements WhatsappService {

    @Value("${whatsapp.api.url}")
    private String whatsappApiUrl;

    @Value("${whatsapp.access.token}")
    private String whatsappAccessToken;
    String mensajePlantilla;


    @Override
    public Void enviarMensaje(String numero, String numeroFactura, Integer tipoNotificacion) {
        // Validar el número de teléfono
        if (!isValidPhoneNumber(numero)) {
            System.out.println("Número de teléfono no válido: " + numero);
            return null; // O lanzar una excepción según tus necesidades
        }

        if (tipoNotificacion == 1) {
            mensajePlantilla = "encamino";
        } else {
            mensajePlantilla = "pendiente";
        }

        try {
            String requestBody = String.format(
                    "{ " +
                            "  \"messaging_product\": \"whatsapp\", " +
                            "  \"recipient_type\": \"individual\", " +
                            "  \"to\": \"%s\", " +
                            "  \"type\": \"template\", " +
                            "  \"template\": { " +
                            "    \"name\": \"%s\", " +
                            "    \"language\": { " +
                            "      \"code\": \"es_AR\" " +
                            "    }, " +
                            "    \"components\": [{ " +
                            "      \"type\": \"body\", " +
                            "      \"parameters\": [{ " +
                            "        \"type\": \"text\", " +
                            "        \"text\": \"%s\" " +
                            "      }] " +
                            "    }] " +
                            "  } " +
                            "}",
                    numero, mensajePlantilla,numeroFactura
            );

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(new URI(whatsappApiUrl))
                    .header("Authorization", "Bearer " + whatsappAccessToken)
                    .header("Content-Type", "application/json")
                    .POST(BodyPublishers.ofString(requestBody))
                    .build();

            HttpClient httpClient = HttpClient.newHttpClient();
            HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());

            // Imprimir la respuesta
            System.out.println("Response Code: " + response.statusCode());
            System.out.println("Response Body: " + response.body());

            // Verificar las cabeceras de la respuesta
            response.headers().map().forEach((k, v) -> System.out.println(k + ":" + v));

        } catch (URISyntaxException | IOException | InterruptedException e) {
            e.printStackTrace();
        }
        return null;
    }

    private boolean isValidPhoneNumber(String phoneNumber) {
        try {
            PhoneNumberUtil phoneNumberUtil = PhoneNumberUtil.getInstance();
            phoneNumberUtil.parse(phoneNumber, "ZZ");
            return phoneNumberUtil.isValidNumber(phoneNumberUtil.parse(phoneNumber, "ZZ"));
        } catch (NumberParseException e) {
            return false;
        }
    }
}
