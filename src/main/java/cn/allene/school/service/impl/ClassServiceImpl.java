package cn.allene.school.service.impl;

import cn.allene.school.mapper.ClassMapper;
import cn.allene.school.po.Class;
import cn.allene.school.po.example.ClassExample;
import cn.allene.school.service.ClassService;
import org.springframework.stereotype.Service;

@Service
public class ClassServiceImpl extends BaseServiceImpl<Class, Integer, ClassExample, ClassMapper> implements ClassService {

}
