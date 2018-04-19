package cn.allene.school.po;

import java.util.Date;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class Child {
    private String id;

    private String password;

    private String nickname;

    private String addr;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date addTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;

    private String sex;

    private Integer classId;

    private String photo;

    private Integer state;
}