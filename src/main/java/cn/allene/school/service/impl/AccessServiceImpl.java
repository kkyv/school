package cn.allene.school.service.impl;

import cn.allene.school.mapper.AccessMapper;
import cn.allene.school.mapper.ChildMapper;
import cn.allene.school.po.Access;
import cn.allene.school.po.Child;
import cn.allene.school.po.example.AccessExample;
import cn.allene.school.po.example.ChildExample;
import cn.allene.school.service.AccessService;
import cn.allene.school.service.ChildService;
import org.springframework.stereotype.Service;

@Service
public class AccessServiceImpl extends BaseServiceImpl<Access, Integer, AccessExample, AccessMapper> implements AccessService {

}
