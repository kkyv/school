package cn.allene.school.service.impl;

import cn.allene.school.mapper.InfoMapper;
import cn.allene.school.mapper.MsgMapper;
import cn.allene.school.po.Info;
import cn.allene.school.po.Msg;
import cn.allene.school.po.example.InfoExample;
import cn.allene.school.po.example.MsgExample;
import cn.allene.school.service.InfoService;
import cn.allene.school.service.MsgService;
import org.springframework.stereotype.Service;

@Service
public class MsgServiceImpl extends BaseServiceImpl<Msg, Integer, MsgExample, MsgMapper> implements MsgService {

}
