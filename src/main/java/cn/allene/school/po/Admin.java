package cn.allene.school.po;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class Admin {
    private Integer id;

    private String password;

    private Integer sex;

    private String email;

    private String phone;

    private String nickname;

    private Integer roleId;

    private Integer state;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date addTime;
}