package cn.allene.school.po;

import java.util.Date;

import lombok.Data;

@Data
public class Class {
    private Integer id;

    private String name;

    private Integer adminId;

    private String notice;

    private String browse;

    private String news;

    private String pic;

    private Date addTime;
}