package cn.allene.school.controller;

import cn.allene.school.annatation.Prefix;
import cn.allene.school.contacts.Contacts;
import cn.allene.school.exp.AjaxException;
import cn.allene.school.po.InfoCate;
import cn.allene.school.po.condition.BaseCondition;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.condition.InfoCateCondition;
import cn.allene.school.services.BaseService;
import cn.allene.school.services.InfoCateService;
import cn.allene.school.utils.CollectionUtils;
import cn.allene.school.vo.AjaxResult;
import cn.allene.school.vo.InfoCateVo;
import lombok.Data;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@Prefix
public abstract class BaseController<T, PK, C extends BaseCondition<PK>, S extends BaseService<T, PK, C>> {
    @Autowired
    @Getter
    private S service;
    @Autowired
    private InfoCateService infoCateService;

    @Getter
    private HttpServletResponse response;
    @Getter
    private HttpServletRequest request;
    @Getter
    private Model model;
    @Getter
    private T po;
    @Getter
    private C condition;

    @ModelAttribute
    private void initialize(HttpServletResponse response, HttpServletRequest request, Model model, T po, C condition) {
        this.response = response;
        this.request = request;
        this.model = model;
        this.po = po;
        this.condition = condition;
    }

//    public void insert(T t) throws SchoolException {
//        service.insert(t);
//    }
//
//    public T query(PK id) throws SchoolException {
//        return service.query(id);
//    }
//
//    public List<T> queryList(C codition) throws SchoolException {
//        return service.queryList(codition);
//    }
//
//    public void delete(PK id) throws SchoolException {
//        service.delete(id);
//    }

    //全局异常处理
    @ExceptionHandler(SchoolException.class)
    public ModelAndView exp(SchoolException exp){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("500");
        return modelAndView;
    }
    @ExceptionHandler(AjaxException.class)
    @ResponseBody
    public AjaxResult ajaxExp(){
        return new AjaxResult(false, "处理失败");
    }

    public void queryCate() throws SchoolException {

        List<InfoCate> infoCateList = infoCateService.queryList(new InfoCateCondition());
        List<InfoCate> infoCateFirstList = infoCateList.stream()
                .filter(infoCate -> infoCate.getFirstId().equals(Contacts.InfoCateCatacts.CATE_0)).collect(Collectors.toList());

        List<InfoCateVo> infoCateFirstVoList = new ArrayList<>();
        for(InfoCate infoFirstCate : infoCateFirstList){
            List<InfoCate> infoCateSecondList = infoCateList.stream().filter(infoCate -> infoCate.getFirstId().equals(infoFirstCate.getId())).collect(Collectors.toList());

            InfoCateVo infoCateVo = new InfoCateVo();
            infoCateVo.setFirstCateName(infoFirstCate.getName());
            infoCateVo.setInfoCates(infoCateSecondList);

            infoCateFirstVoList.add(infoCateVo);
        }
        model.addAttribute("infoCateFirstList", infoCateFirstVoList);
    }
}
