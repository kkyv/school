package cn.allene.school.services;

import cn.allene.school.po.condition.BaseCondition;
import org.springframework.stereotype.Service;


@Service
public interface BaseService<T, PK, C extends BaseCondition<PK>> extends cn.allene.school.services.Service<T, PK, C> {

}
