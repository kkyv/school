package cn.allene.school.dao;

import cn.allene.school.po.condition.BaseCondition;
import cn.allene.school.exp.SchoolException;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BaseMapper<T, PK, C extends BaseCondition> {
    T select(PK id) throws SchoolException;

    List<T> selectList(C condition) throws SchoolException;

    int count(C condition) throws SchoolException;

    void insert(T po) throws SchoolException;

    int update(T po) throws SchoolException;

    int delete(PK id) throws SchoolException;
}
