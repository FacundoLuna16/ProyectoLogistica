package com.siglo21.swiftlogix.application.request.validaciones;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import java.lang.annotation.*;

@Documented // Para que aparezca en la documentacion
@Constraint(validatedBy = NumeroFacturaValidator.class) // Clase que implementa la validacion
@Target({ElementType.FIELD}) // Donde se puede aplicar la validacion
@Retention(RetentionPolicy.RUNTIME) // Cuando se va a aplicar la validacion
public @interface NumeroFacturaValid {

    String message() default "El formato del número de factura es incorrecto";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
