package cn.allene.school.service.impl;

import cn.allene.school.mapper.MsgMapper;
import cn.allene.school.mapper.RoleMapper;
import cn.allene.school.po.Msg;
import cn.allene.school.po.Role;
import cn.allene.school.po.example.MsgExample;
import cn.allene.school.po.example.RoleExample;
import cn.allene.school.service.MsgService;
import cn.allene.school.service.RoleService;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl extends BaseServiceImpl<Role, Integer, RoleExample, RoleMapper> implements RoleService{

}
