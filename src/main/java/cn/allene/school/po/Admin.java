package cn.allene.school.po;

import lombok.Data;

@Data
public class Admin {
    private Integer id;

    private String password;

    private String nickname;

    private Integer roleId;
}