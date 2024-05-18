package beside.poten.server.global.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.security.SignatureException;

import static beside.poten.server.global.exception.ErrorCode.*;


@RestControllerAdvice
public class GlobalExceptionHandler {

    Logger defaultLogger = LoggerFactory.getLogger(GlobalExceptionHandler.class);
    Logger exceptionLogger = LoggerFactory.getLogger("ExceptionLogger");

    @ExceptionHandler(PupcketException.class)
    public ResponseEntity<ExceptionResponse> handlPupcketException(PupcketException e) {
        defaultLogger.warn(e.getMessage());
        exceptionLogger.warn(e.getMessage());

        ExceptionResponse exceptionResponse = ExceptionResponse.fromException(e.getErrorCode());

        return ResponseEntity.status(exceptionResponse.httpStatus()).body(exceptionResponse);
    }

    @ExceptionHandler(value = Exception.class)
    public ResponseEntity<ExceptionResponse> handleDefaultException(Exception e) {
        defaultLogger.error(e.getMessage(), e);
        exceptionLogger.error(e.getMessage(), e);

        ExceptionResponse exceptionResponse = ExceptionResponse.fromError(e);
        return ResponseEntity.status(exceptionResponse.httpStatus()).body(exceptionResponse);
    }

    @ExceptionHandler(SignatureException.class)
    public ResponseEntity<ExceptionResponse> handleSignatureException() {
        defaultLogger.warn(INVALID_TOKEN.getMessage());
        ExceptionResponse exceptionResponse = ExceptionResponse.fromException(INVALID_TOKEN);

        return ResponseEntity.status(exceptionResponse.httpStatus()).body(exceptionResponse);
    }

    @ExceptionHandler(AuthenticationServiceException.class)
    public ResponseEntity<ExceptionResponse> handleAuthenticationServiceExcpetion(AuthenticationServiceException e){
        defaultLogger.warn(INVALID_AUTHENTICATION.getMessage());
        ExceptionResponse exceptionResponse = ExceptionResponse.fromException(INVALID_TOKEN);

        return ResponseEntity.status(exceptionResponse.httpStatus()).body(exceptionResponse);
    }
}
