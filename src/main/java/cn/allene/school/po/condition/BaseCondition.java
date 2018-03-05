package cn.allene.school.po.condition;

import lombok.Data;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BaseCondition<K> {
    private K id;

    private List<K> idList;

    private int pageSize = Integer.MAX_VALUE;

    private int pageNum = 1;

    private String orderBy;

}
