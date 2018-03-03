package cn.allene.school.services.impl;

import cn.allene.school.dao.AdminMapper;
import cn.allene.school.po.Admin;
import cn.allene.school.po.condition.AdminCondition;
import cn.allene.school.services.AdminService;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl extends BaseServiceImpl<Admin, Integer, AdminCondition, AdminMapper> implements AdminService {

}
