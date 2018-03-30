package cn.allene.school.services.impl;

import cn.allene.school.dao.Dao;
import cn.allene.school.dao.mapper.BaseMapper;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.condition.BaseCondition;
import cn.allene.school.services.BaseService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public abstract class BaseServiceImpl<T, PK, C extends BaseCondition<PK>, M extends Dao<T, PK, C>> implements BaseService<T, PK, C> {

    @Autowired
    private M dao;

    @Override
    public T query(PK id) throws SchoolException {
        return dao.select(id);
    }

    @Override
    public List<T> queryList(C condition) throws SchoolException {
        PageHelper.startPage(condition.getPageNum(), condition.getPageSize());
        return dao.selectList(condition);
    }

    @Override
    public int queryCount(C condition) throws SchoolException {
        return dao.count(condition);
    }

    @Override
    public int update(T po) throws SchoolException {
        return dao.update(po);
    }

    @Override
    public void insert(T po) throws SchoolException {
        dao.insert(po);
    }

    @Override
    public void delete(PK id) throws SchoolException {
        dao.delete(id);
    }

    public M getMapper(){
        return this.dao;
    }
}
