package cn.allene.school.vo;

import cn.allene.school.po.Admin;
import cn.allene.school.po.Role;
import lombok.Data;

import java.util.List;

@Data
public class AdminRoleVo{
    private Role role;

    private List<Admin> adminList;
}
