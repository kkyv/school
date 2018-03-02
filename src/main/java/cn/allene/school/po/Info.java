package cn.allene.school.po;

import java.util.Date;

import lombok.Data;

@Data
public class Info {
    private Integer id;

    private String title;

    private String content;

    private Date addTime;

    private Date lastTime;

    private Integer total;

    private Integer cateId;

}