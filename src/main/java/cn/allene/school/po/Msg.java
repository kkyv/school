package cn.allene.school.po;

import java.util.Date;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class Msg {
    private Integer id;

    private String title;

    private String content;

    private String phone;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date time;

    private Integer status;

    private String name;

    private Integer type;

}