package cn.allene.school.po;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class Info implements Serializable{
    private String id;

    private String title;

    private String content;

    private Date addTime;

    private Date lastTime;

    private Integer total;

    private Integer cateId;

}