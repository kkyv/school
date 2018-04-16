package cn.allene.school.dao;

import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Info;
import cn.allene.school.po.condition.BaseCondition;

import java.util.List;

/**
 * create by KKYV on 2018-03-30
 */
public interface Dao<T, PK, C extends BaseCondition> {
    T select(PK id) throws SchoolException;

    List<T> selectList(C condition) throws SchoolException;

    int count(C condition) throws SchoolException;

    PK insert(T po) throws SchoolException;

    int update(T po) throws SchoolException;

    int delete(PK id) throws SchoolException;

    void updateOrInsert(C condition, T po) throws SchoolException;
}
