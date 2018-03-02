package cn.allene.school.po.condition;

import lombok.Data;

import java.util.Date;

@Data
public class ClassCondition extends BaseCondition<Integer>{
    private String name;

    private Date addTime;
}
