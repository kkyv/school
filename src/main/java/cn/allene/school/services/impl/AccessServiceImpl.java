package cn.allene.school.services.impl;

import cn.allene.school.dao.AccessMapper;
import cn.allene.school.po.Access;
import cn.allene.school.po.condition.AccessCondition;
import cn.allene.school.services.AccessService;
import org.springframework.stereotype.Service;

@Service
public class AccessServiceImpl extends BaseServiceImpl<Access, Integer, AccessCondition, AccessMapper> implements AccessService {

}
