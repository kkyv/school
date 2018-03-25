package cn.allene.school.po;

import lombok.Data;

@Data
public class Access {
    private Integer id;

    private String name;

    private String access;

    private String group;

    private String model;

    private Integer state;

    private String groupName;

    private String modelName;
}