package cn.allene.school.services.impl;

import cn.allene.school.dao.RoleAccessMapper;
import cn.allene.school.po.RoleAccess;
import cn.allene.school.po.condition.RoleAccessCondition;
import cn.allene.school.services.RoleAccessService;
import org.springframework.stereotype.Service;

@Service
public class RoleAccessServiceImpl extends BaseServiceImpl<RoleAccess, Integer, RoleAccessCondition, RoleAccessMapper> implements RoleAccessService {

}
