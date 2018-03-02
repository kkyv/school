package cn.allene.school.mapper;

import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Access;
import cn.allene.school.po.condition.BaseCondition;
import cn.allene.school.po.example.AccessExample;
import cn.allene.school.po.example.BaseExample;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BaseMapper<T, PK, E extends BaseExample> {
    int countByExample(E example) throws SchoolException;

    int deleteByExample(E example) throws SchoolException;

    int deleteByPrimaryKey(PK id) throws SchoolException;
    //使用所有的属性作为字段使用
    int insert(T record) throws SchoolException;
    //使用不为null的属性作为字段使用
    int insertSelective(T record) throws SchoolException;

    List<T> selectByExample(E example) throws SchoolException;

    T selectByPrimaryKey(PK id) throws SchoolException;
    //更新新的model中不为空的字段
    int updateByPrimaryKeySelective(T record) throws SchoolException;
    //将为空的字段在数据库中置为NULL
    int updateByPrimaryKey(T record) throws SchoolException;
}
