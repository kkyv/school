package cn.allene.school.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AjaxResult<T> {
    private boolean status;

    private String msg;

    private T data;

    public AjaxResult(boolean status, String msg) {
        this.status = status;
        this.msg = msg;
    }

    public AjaxResult(boolean status, T data) {
        this.status = status;
        this.data = data;
    }
}
