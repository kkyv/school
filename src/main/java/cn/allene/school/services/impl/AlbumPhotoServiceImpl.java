package cn.allene.school.services.impl;

import cn.allene.school.dao.mapper.AlbumPhotoMapper;
import cn.allene.school.po.AlbumPhotoPo;
import cn.allene.school.po.condition.AlbumPhotoCondition;
import cn.allene.school.services.AlbumPhotoService;
import org.springframework.stereotype.Service;

@Service
public class AlbumPhotoServiceImpl extends BaseServiceImpl<AlbumPhotoPo, Integer, AlbumPhotoCondition, AlbumPhotoMapper> implements AlbumPhotoService {

}