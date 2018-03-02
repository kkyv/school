package cn.allene.school.po.condition;

import lombok.Data;

import java.util.Date;

@Data
public class ChildCondition extends BaseCondition<String>{
//    private String id;
//
//    private List<String> idList;

    private String password;

    private String nickName;

    private Date addTime;

    private Date birthday;

    private String sex;

    private Integer classId;
}
