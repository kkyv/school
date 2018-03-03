package cn.allene.school.services.impl;

import cn.allene.school.dao.RoleMapper;
import cn.allene.school.po.Role;
import cn.allene.school.po.condition.RoleCondition;
import cn.allene.school.services.RoleService;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl extends BaseServiceImpl<Role, Integer, RoleCondition, RoleMapper> implements RoleService {

}
