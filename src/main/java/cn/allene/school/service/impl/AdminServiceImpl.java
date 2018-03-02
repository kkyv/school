package cn.allene.school.service.impl;

import cn.allene.school.mapper.AccessMapper;
import cn.allene.school.mapper.AdminMapper;
import cn.allene.school.po.Access;
import cn.allene.school.po.Admin;
import cn.allene.school.po.example.AccessExample;
import cn.allene.school.po.example.AdminExample;
import cn.allene.school.service.AccessService;
import cn.allene.school.service.AdminService;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl extends BaseServiceImpl<Admin, Integer, AdminExample, AdminMapper> implements AdminService {

}
