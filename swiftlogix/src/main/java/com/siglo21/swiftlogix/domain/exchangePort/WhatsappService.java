package com.siglo21.swiftlogix.domain.exchangePort;

public interface WhatsappService {

    Void enviarMensaje(String numero, String numeroFactura, Integer tipoNotificacion);
}
