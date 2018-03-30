package cn.allene.school.services.impl;

import cn.allene.school.dao.mapper.MsgMapper;
import cn.allene.school.po.Msg;
import cn.allene.school.po.condition.MsgCondition;
import cn.allene.school.services.MsgService;
import org.springframework.stereotype.Service;

@Service
public class MsgServiceImpl extends BaseServiceImpl<Msg, Integer, MsgCondition, MsgMapper> implements MsgService {

}
