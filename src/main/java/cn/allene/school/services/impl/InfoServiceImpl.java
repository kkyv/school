package cn.allene.school.services.impl;

import cn.allene.school.dao.mongo.InfoDao;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Info;
import cn.allene.school.po.condition.InfoCondition;
import cn.allene.school.services.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InfoServiceImpl implements InfoService {

    @Autowired
    private InfoDao infoDao;

    @Override
    public Info query(String id) throws SchoolException {
        return infoDao.select(id);
    }

    @Override
    public List<Info> queryList(InfoCondition condition) throws SchoolException {
        return infoDao.selectList(condition);
    }

    @Override
    public int queryCount(InfoCondition condition) throws SchoolException {
        return infoDao.count(condition);
    }

    @Override
    public int update(Info po) throws SchoolException {
        return infoDao.update(po);
    }

    @Override
    public void insert(Info po) throws SchoolException {
        infoDao.insert(po);
    }

    @Override
    public void delete(String id) throws SchoolException {
        infoDao.delete(id);
    }
}
