package cn.allene.school.po;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class Role {
    private Integer id;

    private String name;

    private String desc;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date addTime;

    private String access;
}