package cn.allene.school.service.impl;

import cn.allene.school.mapper.InfoCateMapper;
import cn.allene.school.po.InfoCate;
import cn.allene.school.po.example.InfoCateExample;
import cn.allene.school.service.InfoCateService;
import org.springframework.stereotype.Service;

@Service
public class InfoCateServiceImpl extends BaseServiceImpl<InfoCate, Integer, InfoCateExample, InfoCateMapper> implements InfoCateService {

}
