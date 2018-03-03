package cn.allene.school.services.impl;

import cn.allene.school.dao.BaseMapper;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.condition.BaseCondition;
import cn.allene.school.services.BaseService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public abstract class BaseServiceImpl<T, PK, C extends BaseCondition<PK>, M extends BaseMapper<T, PK, C>> implements BaseService<T, PK, C> {

    @Autowired
    private M baseMapper;

    @Override
    public T query(PK id) throws SchoolException {
        return baseMapper.select(id);
    }

    @Override
    public List<T> queryList(C condition) throws SchoolException {
        PageHelper.startPage(condition.getPageNum(), condition.getPageSize());
        return baseMapper.selectList(condition);
    }

    @Override
    public int queryCount(C condition) throws SchoolException {
        return baseMapper.count(condition);
    }

    @Override
    public int update(T po) throws SchoolException {
        return baseMapper.update(po);
    }

    @Override
    public void insert(T po) throws SchoolException {
        baseMapper.insert(po);
    }

    @Override
    public void delete(PK id) throws SchoolException {
        baseMapper.delete(id);
    }

    public M getMapper(){
        return this.baseMapper;
    }
}
