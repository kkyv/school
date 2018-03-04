package cn.allene.school.exp;

import org.springframework.ui.Model;

public class SchoolException extends Exception {
    private Integer code;

    public SchoolException() {
        super();
        this.code = code;
    }

    public SchoolException(String message) {
        super(message);
    }

    public SchoolException(String message, Throwable cause) {
        super(message, cause);
    }

    public SchoolException(Throwable cause) {
        super(cause);
    }

    protected SchoolException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }

    public Integer getCode() {
        return code;
    }
}
