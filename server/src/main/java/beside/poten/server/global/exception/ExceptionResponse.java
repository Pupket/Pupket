package beside.poten.server.global.exception;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import org.springframework.http.HttpStatus;

import static beside.poten.server.global.exception.ErrorCode.*;

@JsonInclude
public record ExceptionResponse(String status, @JsonIgnore HttpStatus httpStatus, Integer code, String messgae) {

    public static ExceptionResponse fromException(ErrorCode errorCode) {
        return  new ExceptionResponse("REJECT",
                errorCode.getHttpStatus(),
                errorCode.getCode(),
                errorCode.getMessage());
    }

    public static ExceptionResponse fromError(Exception e) {
        return new ExceptionResponse("ERROR",
                NOT_HANDLED_EXCEPTION.getHttpStatus(),
                NOT_HANDLED_EXCEPTION.getCode(),
                e.getMessage());
    }

}
