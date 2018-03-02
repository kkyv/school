package cn.allene.school.service.impl;

import cn.allene.school.mapper.AdminMapper;
import cn.allene.school.mapper.AdminRoleMapper;
import cn.allene.school.po.Admin;
import cn.allene.school.po.AdminRole;
import cn.allene.school.po.example.AdminExample;
import cn.allene.school.po.example.AdminRoleExample;
import cn.allene.school.service.AdminRoleService;
import cn.allene.school.service.AdminService;
import org.springframework.stereotype.Service;

@Service
public class AdminRoleServiceImpl extends BaseServiceImpl<AdminRole, Integer, AdminRoleExample, AdminRoleMapper> implements AdminRoleService {

}
