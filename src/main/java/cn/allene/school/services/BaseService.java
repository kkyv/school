package cn.allene.school.services;

import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.condition.BaseCondition;
import cn.allene.school.po.example.BaseExample;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BaseService<T, PK, C extends BaseCondition<PK>>{
    T query(PK id) throws SchoolException;

    List<T> queryList(C condition) throws SchoolException;

    int queryCount(C condition) throws SchoolException;

    int update(T po) throws SchoolException;

    void insert(T po) throws SchoolException;

    void delete(PK id) throws SchoolException;


}
