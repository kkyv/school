package cn.allene.school.dao;

import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Admin;
import cn.allene.school.po.condition.AdminCondition;
import org.apache.ibatis.annotations.Param;

public interface AdminMapper extends BaseMapper<Admin, Integer, AdminCondition> {
    void delRole(@Param("roleId") Integer roleId) throws SchoolException;
}