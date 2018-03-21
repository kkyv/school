package cn.allene.school.po;

import lombok.Data;

import java.util.Date;

@Data
public class Role {
    private Integer id;

    private String name;

    private String desc;

    private Date addTime;

    private String access;
}