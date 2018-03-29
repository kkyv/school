package cn.allene.school.dao;

import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Info;
import cn.allene.school.po.condition.BaseCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;

import java.util.List;

/**
 * create by KKYV on 2018-03-29
 */
public abstract class InfoDao<T, K, C extends BaseCondition<K>> implements BaseMapper<T, K, C> {

    @Autowired
    protected MongoTemplate mongoTemplate;

    @Override
    public T select(K id) throws SchoolException {
        mongoTemplate.findById(id, this.getEntityClass());
        return null;
    }

    @Override
    public List<T> selectList(C condition) throws SchoolException {
        return null;
    }

    @Override
    public int count(C condition) throws SchoolException {
        return 0;
    }

    @Override
    public void insert(T po) throws SchoolException {

    }

    @Override
    public int update(T po) throws SchoolException {
        return 0;
    }

    @Override
    public int delete(K id) throws SchoolException {
        return 0;
    }

    private Class<T> getEntityClass(){

    }
}
