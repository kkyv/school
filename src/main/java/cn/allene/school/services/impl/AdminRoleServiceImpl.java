package cn.allene.school.services.impl;

import cn.allene.school.dao.mapper.AdminRoleMapper;
import cn.allene.school.po.AdminRole;
import cn.allene.school.po.condition.AdminRoleCondition;
import cn.allene.school.services.AdminRoleService;
import org.springframework.stereotype.Service;

@Service
public class AdminRoleServiceImpl extends BaseServiceImpl<AdminRole, Integer, AdminRoleCondition, AdminRoleMapper> implements AdminRoleService {

}
