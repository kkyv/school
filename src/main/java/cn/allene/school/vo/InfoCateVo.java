package cn.allene.school.vo;

import cn.allene.school.po.InfoCate;
import lombok.Data;

import java.util.List;

@Data
public class InfoCateVo {
    private String firstCateName;

    private List<InfoCate> infoCates;
}
