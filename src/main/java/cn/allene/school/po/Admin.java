package cn.allene.school.po;

import lombok.Data;

import java.util.Date;

@Data
public class Admin {
    private Integer id;

    private String password;

    private String phone;

    private String nickname;

    private Integer roleId;

    private Integer state;

    private Date addTime;
}