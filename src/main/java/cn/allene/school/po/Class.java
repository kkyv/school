package cn.allene.school.po;

import java.util.Date;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class Class {
    private Integer id;

    private String name;

    private Integer adminId;

    private String notice;

    private String browse;

    private String news;

    private String pic;

    private Integer state;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date addTime;
}