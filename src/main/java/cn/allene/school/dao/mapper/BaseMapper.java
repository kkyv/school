package cn.allene.school.dao.mapper;

import cn.allene.school.dao.Dao;
import cn.allene.school.po.condition.BaseCondition;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BaseMapper<T, PK, C extends BaseCondition> extends Dao<T, PK, C> {
}
