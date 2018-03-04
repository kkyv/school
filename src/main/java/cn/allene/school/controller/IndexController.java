package cn.allene.school.controller;

import cn.allene.school.contacts.Contacts;
import cn.allene.school.contacts.InfoCateEnum;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Class;
import cn.allene.school.po.Info;
import cn.allene.school.po.InfoCate;
import cn.allene.school.po.condition.ClassCondition;
import cn.allene.school.po.condition.InfoCateCondition;
import cn.allene.school.po.condition.InfoCondition;
import cn.allene.school.services.ClassService;
import cn.allene.school.services.InfoCateService;
import cn.allene.school.services.InfoService;
import cn.allene.school.utils.CollectionUtils;
import cn.allene.school.vo.InfoCateVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.lang.reflect.Field;
import java.util.*;
import java.util.stream.Collectors;

@Controller
public class IndexController extends BaseController<InfoCate, Integer, InfoCateCondition, InfoCateService>{

    @Autowired
    private InfoService infoService;
    @Autowired
    private ClassService classService;

    @RequestMapping("/")
    public String index(Model model) throws SchoolException {

        this.queryCate(model);

        InfoCondition infoCondition = new InfoCondition();
        List<Integer> cateIdList = new ArrayList<>();
        cateIdList.add(InfoCateEnum.CATE_1.getId());
        cateIdList.add(InfoCateEnum.CATE_13.getId());
        cateIdList.add(InfoCateEnum.CATE_15.getId());
        cateIdList.add(InfoCateEnum.CATE_17.getId());
        cateIdList.add(InfoCateEnum.CATE_22.getId());
        infoCondition.setCateIdList(cateIdList);
        List<Info> infos = infoService.queryList(infoCondition);

        List<Info> cate1Info = infos.stream().
                filter(info -> info.getCateId().equals(InfoCateEnum.CATE_1_.getFirstId()))
                    .collect(Collectors.toList());
        List<Info> cate13InfoList = infos.stream().filter(info -> info.getCateId().equals(InfoCateEnum.CATE_13.getId())).collect(Collectors.toList());
        List<Info> cate15InfoList = infos.stream().filter(info -> info.getCateId().equals(InfoCateEnum.CATE_15.getId())).collect(Collectors.toList());
        List<Info> cate17InfoList = infos.stream().filter(info -> info.getCateId().equals(InfoCateEnum.CATE_17.getId())).collect(Collectors.toList());
        List<Info> cate22InfoList = infos.stream().filter(info -> info.getCateId().equals(InfoCateEnum.CATE_22.getId())).collect(Collectors.toList());

        if(CollectionUtils.isNotEmpty(cate1Info)){
            model.addAttribute("prompt", infos.get(0));
        }

        model.addAttribute("cate13InfoList",cate13InfoList);
        model.addAttribute("cate15InfoList", cate15InfoList);
        model.addAttribute("cate17InfoList",cate17InfoList);
        model.addAttribute("cate22InfoList",cate22InfoList);

        List<Class> classList = classService.queryList(new ClassCondition());
        model.addAttribute(classList);

        return "index";
    }
}
