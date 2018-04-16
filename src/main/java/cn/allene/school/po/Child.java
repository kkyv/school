package cn.allene.school.po;

import java.util.Date;

import lombok.Data;

@Data
public class Child {
    private String id;

    private String password;

    private String nickname;

    private String addr;

    private Date addTime;

    private Date birthday;

    private String sex;

    private Integer classId;

    private String photo;
}