package cn.allene.school.controller;

import cn.allene.school.annatation.Prefix;
import cn.allene.school.compent.RedisCompent;
import cn.allene.school.exp.AjaxException;
import cn.allene.school.po.InfoCate;
import cn.allene.school.po.condition.BaseCondition;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.services.BaseService;
import cn.allene.school.services.InfoCateService;
import cn.allene.school.vo.AjaxResult;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;
import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
@Prefix
public abstract class BaseController<T, PK, C extends BaseCondition<PK>, S extends BaseService<T, PK, C>> {
    @Autowired
    @Getter
    private S service;
    @Getter
    private Model model;
    @Autowired
    private RedisCompent redisCompent;

    @ModelAttribute
    protected void initialize(Model model) throws SchoolException {
        this.model = model;
        this.queryCate();
    }


    //全局异常处理
    @ExceptionHandler(SchoolException.class)
    public ModelAndView exp(SchoolException exp){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        return modelAndView;
    }


    @ExceptionHandler(AjaxException.class)
    @ResponseBody
    public AjaxResult ajaxExp(){
        return new AjaxResult(false, "处理失败");
    }


    public Map<String, InfoCate> queryCate() throws SchoolException {
        Map<String, InfoCate> infoCateMap = redisCompent.infaCate("info-cate");
        this.model.addAttribute("cateGroupMap", infoCateMap);
        return infoCateMap;
    }
}
