package cn.allene.school.services.impl;

import cn.allene.school.dao.AdminMapper;
import cn.allene.school.dao.RoleMapper;
import cn.allene.school.exp.AjaxException;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Admin;
import cn.allene.school.po.condition.AdminCondition;
import cn.allene.school.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AdminServiceImpl extends BaseServiceImpl<Admin, Integer, AdminCondition, AdminMapper> implements AdminService {

    @Autowired
    private RoleMapper roleMapper;
    @Override
    @Transactional(rollbackFor = SchoolException.class)
    public void delRole(List<Integer> roleIdList) throws AjaxException {
        for(Integer roleId : roleIdList){
            try {
                roleMapper.delete(roleId);
                this.getMapper().delRole(roleId);
            } catch (SchoolException e) {
                throw new AjaxException();
            }
        }
    }
}
