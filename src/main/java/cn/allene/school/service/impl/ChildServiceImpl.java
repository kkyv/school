package cn.allene.school.service.impl;

import cn.allene.school.mapper.ChildMapper;
import cn.allene.school.po.Child;
import cn.allene.school.po.example.ChildExample;
import cn.allene.school.service.ChildService;
import org.springframework.stereotype.Service;

@Service
public class ChildServiceImpl extends BaseServiceImpl<Child, String, ChildExample, ChildMapper> implements ChildService {

}
