package beside.poten.server.global.exception;

import com.auth0.jwt.exceptions.JWTVerificationException;
import org.apache.coyote.BadRequestException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
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
    public ResponseEntity<ExceptionResponse> handleAuthenticationServiceExcpetion(AuthenticationServiceException e) {
        defaultLogger.warn(e.getMessage());

        ExceptionResponse exceptionResponse = ExceptionResponse.fromException(INVALID_AUTHENTICATION);

        return ResponseEntity.status(exceptionResponse.httpStatus()).body(exceptionResponse);


    }

    @ExceptionHandler(UsernameNotFoundException.class)
    public ResponseEntity<ExceptionResponse> handleUsenameNotFoundException(UsernameNotFoundException e) {
        defaultLogger.warn(e.getMessage());

        ExceptionResponse exceptionResponse = ExceptionResponse.fromException(USER_NOT_FOUND);

        return ResponseEntity.status(exceptionResponse.httpStatus()).body(exceptionResponse);
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<ExceptionResponse> handleIllegalArgumentException(IllegalArgumentException e) {
        defaultLogger.warn(e.getMessage());

        ExceptionResponse exceptionResponse = ExceptionResponse.fromException(ILLEGAL_ARGUMENT);


        return ResponseEntity.status(exceptionResponse.httpStatus()).body(exceptionResponse);
    }

    @ExceptionHandler(JWTVerificationException.class)
    public ResponseEntity<ExceptionResponse> handleJWTVerificationException(JWTVerificationException e) {
        defaultLogger.warn(e.getMessage());

        ExceptionResponse exceptionResponse = ExceptionResponse.fromException(INVALID_TOKEN);

        return ResponseEntity.status(exceptionResponse.httpStatus()).body(exceptionResponse);
    }

    @ExceptionHandler(AuthenticationException.class)
    public ResponseEntity<ExceptionResponse> handleAuthenticationException(AuthenticationException e) {
        defaultLogger.warn(e.getMessage());

        ExceptionResponse exceptionResponse = ExceptionResponse.fromException(INVALID_AUTHENTICATION);

        return ResponseEntity.status(exceptionResponse.httpStatus()).body(exceptionResponse);
    }

    @ExceptionHandler(BadRequestException.class)
    public ResponseEntity<ExceptionResponse> handleBadRequestException(BadRequestException e) {
        defaultLogger.warn(e.getMessage());

        ExceptionResponse exceptionResponse = ExceptionResponse.fromException(INVALID_PARAMETER);

        return ResponseEntity.status(exceptionResponse.httpStatus()).body(exceptionResponse);
    }

    @ExceptionHandler(DataIntegrityViolationException.class)
    public ResponseEntity<ExceptionResponse> handleDataIntegrityViolationException(DataIntegrityViolationException e) {
        defaultLogger.warn(e.getMessage());

        ExceptionResponse exceptionResponse = ExceptionResponse.fromException(DUPLICATE_RESOURCE);

        return ResponseEntity.status(exceptionResponse.httpStatus()).body(exceptionResponse);
    }

}
