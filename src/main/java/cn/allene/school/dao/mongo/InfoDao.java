package cn.allene.school.dao.mongo;

import cn.allene.school.dao.Dao;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Info;
import cn.allene.school.po.condition.InfoCondition;
import org.springframework.stereotype.Repository;

import javax.xml.crypto.Data;
import java.util.List;

/**
 * create by KKYV on 2018-03-29
 */
@Repository
public interface InfoDao extends Dao<Info, String, InfoCondition>{
//    Info select(String id) throws SchoolException;
//
//    List<Info> selectList(InfoCondition condition) throws SchoolException;
//
//    int count(InfoCondition condition) throws SchoolException;
//
//    int insert(Info po) throws SchoolException;
//
//    int update(Info po) throws SchoolException;
//
//    int delete(String id) throws SchoolException;
}

