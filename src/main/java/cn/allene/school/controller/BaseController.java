package cn.allene.school.controller;

import cn.allene.school.po.condition.BaseCondition;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.example.BaseExample;
import cn.allene.school.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public abstract class BaseController<T, PK, C extends BaseCondition<PK>, S extends BaseService<T, PK, C>> {
    @Autowired
    private S service;

    public String returnPage(String page, String attrName, Object attr){
        ModelAndView modelAndView = new ModelAndView(page);
        modelAndView.addObject(attrName, attr);
        return page;
    }

    @RequestMapping("/add")
    public void add(T t) throws SchoolException {
        service.insert(t);
    }

    @RequestMapping("/query/{id}")
    public void query(Model model, @PathVariable("id") PK id) throws SchoolException {
        T query = service.query(id);
        model.addAttribute(query.getClass().getSimpleName(), query);
    }

    @RequestMapping("/queryList")
    public void queryList(Model model, C codition) throws SchoolException {
        List<T> query = service.queryList(codition);
        model.addAttribute(query.getClass().getSimpleName(), query);
    }

    @RequestMapping("/delete/{id}")
    public void delete(Model model, @PathVariable("id") PK id) throws SchoolException {
        service.delete(id);
    }

    public S getService(){
        return service;
    }

    //全局异常处理
    @ExceptionHandler(SchoolException.class)
    public void exp(SchoolException exp, Model model){
//        if()
        String message = exp.getMessage();
        model.addAttribute("msg", exp.getMessage());
    }
}
