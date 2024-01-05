package com.siglo21.swiftlogix.infrastructure.adapters.whatsapp;

import com.google.i18n.phonenumbers.NumberParseException;
import com.google.i18n.phonenumbers.PhoneNumberUtil;
import com.siglo21.swiftlogix.domain.exchangePort.WhatsappService;
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

    private final static String WHATSAPP_API_URL = "https://graph.facebook.com/v17.0/194375103762620/messages";
    private final static String ACCESS_TOKEN = "EAAWBi86JZAKYBO34wK6qpQlVNpXizg9IDRze8Pz7Lp7DDoSlRiIWY2uM4gQvzwYHDYvKvSQUloUBaGzgUxvbZCif8nYnRX9FsvOmUIkLbNlMsrp8COPOPqZAIOE87Yu72sQajuCG1JLgilwbb6aRcOvZClZAZBU5j5z4LnIl06kydte0BeWgMWvZAQVjILteXK2"; // Replace with your access token
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
                            "        \"text\": \"%s\" " + // Inserta aquí la variable del número de factura
                            "      }] " +
                            "    }] " +
                            "  } " +
                            "}",
                    numero, mensajePlantilla,numeroFactura
            );

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(new URI(WHATSAPP_API_URL))
                    .header("Authorization", "Bearer " + ACCESS_TOKEN)
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
