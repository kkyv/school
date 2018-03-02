package cn.allene.school.service.impl;

import cn.allene.school.exp.SchoolException;
import cn.allene.school.mapper.BaseMapper;
import cn.allene.school.po.example.BaseExample;
import cn.allene.school.service.BaseService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public abstract class BaseServiceImpl<T, PK, E extends BaseExample, M extends BaseMapper<T, PK, E>> implements BaseService<T, PK, E> {

    @Autowired
    private M baseMapper;

    @Override
    public T query(PK id) throws SchoolException {
        return baseMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<T> queryList(E example) throws SchoolException {
        PageHelper.startPage(example.getPageNum(), example.getPageSize());
        return baseMapper.selectByExample(example);
    }

    @Override
    public int queryCount(E example) throws SchoolException {
        return baseMapper.countByExample(example);
    }

    @Override
    public int update(T po) throws SchoolException {
        return baseMapper.updateByPrimaryKeySelective(po);
    }

    @Override
    public void insert(T po) throws SchoolException {
        baseMapper.insertSelective(po);
    }

    @Override
    public void delete(PK id) throws SchoolException {
        baseMapper.deleteByPrimaryKey(id);
    }

    public M getMapper(){
        return this.baseMapper;
    }
}
