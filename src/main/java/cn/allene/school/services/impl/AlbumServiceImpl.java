package cn.allene.school.services.impl;

import cn.allene.school.dao.mapper.AlbumMapper;
import cn.allene.school.po.AlbumPo;
import cn.allene.school.po.condition.AlbumCondition;
import cn.allene.school.services.AlbumService;
import org.springframework.stereotype.Service;

@Service
public class AlbumServiceImpl extends BaseServiceImpl<AlbumPo, Integer, AlbumCondition, AlbumMapper> implements AlbumService {

}