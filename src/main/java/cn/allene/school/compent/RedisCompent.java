package cn.allene.school.compent;

import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.InfoCate;
import cn.allene.school.po.condition.InfoCateCondition;
import cn.allene.school.services.InfoCateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Component
public class RedisCompent {

    @Autowired
    private InfoCateService infoCateService;

    @Cacheable(value = "mysqlCache", key = "#key")
    public Map<String, InfoCate> infaCate(String key) throws SchoolException {
        List<InfoCate> infoCateList = infoCateService.queryList(new InfoCateCondition());
        Map<String, InfoCate> infoCateMap = infoCateList.stream().collect(Collectors.toMap(m -> String.valueOf(m.getId()), Function.identity()));
        return infoCateMap;
    }
}
