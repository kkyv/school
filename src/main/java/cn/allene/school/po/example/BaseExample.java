package cn.allene.school.po.example;

import lombok.Data;

@Data
public class BaseExample {
    private int pageSize = Integer.MAX_VALUE;

    private int pageNum = 1;
}
