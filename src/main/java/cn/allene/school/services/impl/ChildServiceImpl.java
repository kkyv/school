package cn.allene.school.services.impl;

import cn.allene.school.dao.mapper.ChildMapper;
import cn.allene.school.po.Child;
import cn.allene.school.po.condition.ChildCondition;
import cn.allene.school.services.ChildService;
import org.springframework.stereotype.Service;

@Service
public class ChildServiceImpl extends BaseServiceImpl<Child, String, ChildCondition, ChildMapper> implements ChildService {

}
