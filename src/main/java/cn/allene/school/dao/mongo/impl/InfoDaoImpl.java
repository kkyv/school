package cn.allene.school.dao.mongo.impl;

import cn.allene.school.dao.mongo.InfoDao;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Info;
import cn.allene.school.po.condition.InfoCondition;
import com.mongodb.WriteResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * create by KKYV on 2018-03-29
 */
@Repository
public class InfoDaoImpl implements InfoDao {

    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public Info select(String id) throws SchoolException {
        return mongoTemplate.findById(id, getEntityClass());
    }

    @Override
    public List<Info> selectList(InfoCondition condition) throws SchoolException {
        return mongoTemplate.find(condition.toQuery(), getEntityClass());
    }

    @Override
    public int count(InfoCondition condition) throws SchoolException {
        return (int) mongoTemplate.count(condition.toQuery(), getEntityClass());
    }

    @Override
    public String insert(Info po) throws SchoolException {
        mongoTemplate.insert(po);
        return po.getId();
    }

    @Override
    public int update(Info po) throws SchoolException {
        WriteResult result = mongoTemplate.updateFirst(Query.query(Criteria.where("id").is(po.getId())), po.getUpdate(), getEntityClass());
        return result.getN();
    }

    @Override
    public int delete(String id) throws SchoolException {
        InfoCondition infoCondition = new InfoCondition();
        infoCondition.setState(null);
        infoCondition.setId(id);
        WriteResult remove = mongoTemplate.remove(infoCondition.toQuery(), getEntityClass());
        return remove.getN();
    }

    @Override
    public void updateOrInsert(InfoCondition condition, Info po) throws SchoolException{
        mongoTemplate.upsert(Query.query(Criteria.where("id").is(po.getId())), po.getUpdate(), getEntityClass());
    }

    public Class<Info> getEntityClass() {
        return Info.class;
    }
}
