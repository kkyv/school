package cn.allene.school.service.impl;

import cn.allene.school.mapper.AdminRoleMapper;
import cn.allene.school.mapper.RoleAccessMapper;
import cn.allene.school.po.AdminRole;
import cn.allene.school.po.RoleAccess;
import cn.allene.school.po.example.AdminRoleExample;
import cn.allene.school.po.example.RoleAccessExample;
import cn.allene.school.service.AdminRoleService;
import cn.allene.school.service.RoleAccessService;
import org.springframework.stereotype.Service;

@Service
public class RoleAccessServiceImpl extends BaseServiceImpl<RoleAccess, Integer, RoleAccessExample, RoleAccessMapper> implements RoleAccessService {

}
