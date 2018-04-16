package cn.allene.school.services;

import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Info;
import cn.allene.school.po.condition.InfoCondition;

import java.util.List;

public interface InfoService extends BaseService<Info, String, InfoCondition>{
//    Info query(String id) throws SchoolException;
//
//    List<Info> queryList(InfoCondition condition) throws SchoolException;
//
//    int queryCount(InfoCondition condition) throws SchoolException;
//
//    int update(Info po) throws SchoolException;
//
//    void insert(Info po) throws SchoolException;
//
//    void delete(String id) throws SchoolException;

    int asyncUpdate(Info po) throws SchoolException;
}
