package cn.allene.school.services;

import cn.allene.school.exp.AjaxException;
import cn.allene.school.po.Admin;
import cn.allene.school.po.condition.AdminCondition;

import java.util.List;

public interface AdminService extends BaseService<Admin, Integer, AdminCondition> {

    void delRole(List<Integer> roleIdList) throws AjaxException;
}
