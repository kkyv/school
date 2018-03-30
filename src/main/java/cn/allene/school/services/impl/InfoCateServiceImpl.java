package cn.allene.school.services.impl;

import cn.allene.school.dao.mapper.InfoCateMapper;
import cn.allene.school.po.InfoCate;
import cn.allene.school.po.condition.InfoCateCondition;
import cn.allene.school.services.InfoCateService;
import org.springframework.stereotype.Service;

@Service
public class InfoCateServiceImpl extends BaseServiceImpl<InfoCate, Integer, InfoCateCondition, InfoCateMapper> implements InfoCateService {

}
