package com.siglo21.swiftlogix.application.request.validaciones;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class NumeroFacturaValidator implements ConstraintValidator<NumeroFacturaValid, String> {

    private static final String PATRON_FACTURA = "^[A-Ba-b]-\\d{4}-\\d{8}$";

    @Override
    public void initialize(NumeroFacturaValid constraintAnnotation) {
    }

    @Override
    public boolean isValid(String numeroFactura, ConstraintValidatorContext context) {
        if (numeroFactura == null) {
            return false;
        }

        Pattern pattern = Pattern.compile(PATRON_FACTURA);
        Matcher matcher = pattern.matcher(numeroFactura);

        return matcher.matches();
    }
}

