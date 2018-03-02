package cn.allene.school.po.condition;

import lombok.Data;

import java.util.List;

@Data
public class BaseCondition<K> {
    private K id;

    private List<K> idList;

    private int pageSize = Integer.MAX_VALUE;

    private int pageNum = 1;

    private String orderBy;
}
