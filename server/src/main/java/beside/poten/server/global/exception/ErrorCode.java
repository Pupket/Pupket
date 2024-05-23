package beside.poten.server.global.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.http.HttpStatus;

import static org.springframework.http.HttpStatus.*;
import static org.springframework.http.HttpStatus.UNAUTHORIZED;

@Getter
@AllArgsConstructor
public enum ErrorCode {
    NOT_HANDLED_EXCEPTION(INTERNAL_SERVER_ERROR, "Error", 900),

    DUPLICATE_RESOURCE(CONFLICT, "Duplicate Resource", 1),
    INVALID_PARAMETER(BAD_REQUEST, "BAD Request", 2),
    INVALID_AUTHENTICATION(UNAUTHORIZED, "Invalid Authentication", 3),
    INVALID_TOKEN(UNAUTHORIZED, "Invalid Token", 4),
    MALFORMED_TOKEN(UNAUTHORIZED, "Malformed Token", 5),
    EXPIRED_TOKEN(UNAUTHORIZED, "Expired Token", 6),
    USER_NOT_FOUND(NOT_FOUND, "Can't find User", 7),
    ILLEGAL_ARGUMENT(BAD_REQUEST, "Illegal Argument", 8),





    ;

    private final HttpStatus httpStatus;
    private final String message;
    private final Integer code;
}
