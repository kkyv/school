package cn.allene.school.service;

import cn.allene.school.po.condition.BaseCondition;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.example.BaseExample;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BaseService<T, PK, E extends BaseExample>{
    T query(PK id) throws SchoolException;

    List<T> queryList(E example) throws SchoolException;

    int queryCount(E example) throws SchoolException;

    int update(T po) throws SchoolException;

    void insert(T po) throws SchoolException;

    void delete(PK id) throws SchoolException;


}
