package cn.allene.school.po;

import java.util.Date;

import lombok.Data;

@Data
public class Msg {
    private Integer id;

    private String title;

    private String content;

    private String phone;

    private Date time;

    private String status;

    private Integer childId;

}