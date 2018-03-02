package cn.allene.school.service.impl;

import cn.allene.school.mapper.InfoMapper;
import cn.allene.school.po.Info;
import cn.allene.school.po.example.InfoExample;
import cn.allene.school.service.InfoService;
import org.springframework.stereotype.Service;

@Service
public class InfoServiceImpl extends BaseServiceImpl<Info, Integer, InfoExample, InfoMapper> implements InfoService {

}
