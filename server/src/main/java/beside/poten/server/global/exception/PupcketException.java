package beside.poten.server.global.exception;

import org.springframework.http.HttpStatus;

public class PupcketException extends RuntimeException {

    private final ErrorCode errorCode;

    public PupcketException(ErrorCode errorCode) {
        super((errorCode.getMessage()));
        this.errorCode = errorCode;
    }

    public  ErrorCode getErrorCode() {
        return  this.errorCode;
    }

    public HttpStatus getHttpStatus() {
        return this.getErrorCode().getHttpStatus();
    }

    public String getErrorMessge(){
        return this.errorCode.getMessage();
    }
}
