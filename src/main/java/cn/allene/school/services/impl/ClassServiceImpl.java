package cn.allene.school.services.impl;

import cn.allene.school.dao.mapper.ClassMapper;
import cn.allene.school.po.Class;
import cn.allene.school.po.condition.ClassCondition;
import cn.allene.school.services.ClassService;
import org.springframework.stereotype.Service;

@Service
public class ClassServiceImpl extends BaseServiceImpl<Class, Integer, ClassCondition, ClassMapper> implements ClassService {

}
