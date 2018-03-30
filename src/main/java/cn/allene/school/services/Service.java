package cn.allene.school.services;

import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.condition.BaseCondition;

import java.util.List;

/**
 * create by KKYV on 2018-03-30
 */
public interface Service<T, PK, C extends BaseCondition<PK>> {
    T query(PK id) throws SchoolException;

    List<T> queryList(C condition) throws SchoolException;

    int queryCount(C condition) throws SchoolException;

    int update(T po) throws SchoolException;

    void insert(T po) throws SchoolException;

    void delete(PK id) throws SchoolException;
}

