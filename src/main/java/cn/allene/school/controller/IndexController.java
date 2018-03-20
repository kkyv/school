package cn.allene.school.controller;

import cn.allene.school.contacts.Contacts;
import cn.allene.school.contacts.InfoCateEnum;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Admin;
import cn.allene.school.po.Class;
import cn.allene.school.po.Info;
import cn.allene.school.po.InfoCate;
import cn.allene.school.po.condition.AdminCondition;
import cn.allene.school.po.condition.ClassCondition;
import cn.allene.school.po.condition.InfoCateCondition;
import cn.allene.school.po.condition.InfoCondition;
import cn.allene.school.services.AdminService;
import cn.allene.school.services.ClassService;
import cn.allene.school.services.InfoCateService;
import cn.allene.school.services.InfoService;
import cn.allene.school.utils.CollectionUtils;
import cn.allene.school.utils.MD5Utils;
import cn.allene.school.vo.InfoCateVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
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
    @Autowired
    private AdminService adminService;

    @RequestMapping("/")
    public String index() throws SchoolException {

        this.queryCate();

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
            getModel().addAttribute("prompt", infos.get(0));
        }

        getModel().addAttribute("cate13InfoList",cate13InfoList);
        getModel().addAttribute("cate15InfoList", cate15InfoList);
        getModel().addAttribute("cate17InfoList",cate17InfoList);
        getModel().addAttribute("cate22InfoList",cate22InfoList);

        List<Class> classList = classService.queryList(new ClassCondition());
        getModel().addAttribute(classList);

        return "index";
    }


    @RequestMapping("/admin/login")
    public String login(Admin admin) throws SchoolException {
        if(getPo().getId() == null){
            return "login";
        }

        AdminCondition adminCondition = new AdminCondition();
        adminCondition.setId(admin.getId());
        adminCondition.setPassword(MD5Utils.MD5(admin.getPassword()));
        List<Admin> adminList = adminService.queryList(adminCondition);
        if(CollectionUtils.isEmpty(adminList)){
            return "login";
        }

        String prePage = (String) getRequest().getSession().getAttribute("prePage");
        this.getRequest().getSession().setAttribute(Contacts.Session.ADMIN, this.getPo());
        if(!StringUtils.isEmpty(prePage)){
            return "redirect:" + prePage;
        }else{
            return "index";
        }
    }
}
