package cn.allene.school.dao.impl;

import cn.allene.school.dao.InfoDao;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Info;
import cn.allene.school.po.condition.InfoCondition;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * create by KKYV on 2018-03-29
 */
public class InfoDaoImpl extends InfoDao {

    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public Info select(String id) throws SchoolException {
        return mongoTemplate.findById(id, Info.class);
    }

    @Override
    public List<Info> selectList(InfoCondition condition) throws SchoolException {
        return mongoTemplate.find(condition.toQuery(), Info.class);
    }

    @Override
    public int count(InfoCondition condition) throws SchoolException {
        return (int) mongoTemplate.count(condition.toQuery(), Info.class);
    }

    @Override
    public void insert(Info po) throws SchoolException {
        mongoTemplate.insert(po);
    }

    @Override
    public int update(Info po) throws SchoolException {
        Update update = new Update();
        update.addToSet("title", )
        return mongoTemplate.updateFirst(Query.query(Criteria.where("id").is(po.getId())), , Info.class);
    }

    @Override
    public int delete(String id) throws SchoolException {
        return 0;
    }
}
