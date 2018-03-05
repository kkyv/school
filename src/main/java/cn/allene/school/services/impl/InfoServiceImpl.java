package cn.allene.school.services.impl;

import cn.allene.school.dao.InfoMapper;
import cn.allene.school.po.Info;
import cn.allene.school.po.condition.InfoCondition;
import cn.allene.school.services.InfoService;
import org.springframework.stereotype.Service;

@Service
public class InfoServiceImpl extends BaseServiceImpl<Info, Integer, InfoCondition, InfoMapper> implements InfoService {

}
