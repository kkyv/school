package cn.allene.school.controller;

import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Class;
import cn.allene.school.po.condition.ClassCondition;
import cn.allene.school.services.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/class")
public class ClassController extends BaseController<Class, Integer, ClassCondition, ClassService> {

    @RequestMapping("/list")
    public String list(Model model) throws SchoolException {
        this.queryCate(model);

        List<Class> classList = this.queryList(new ClassCondition());
        model.addAttribute(classList);
        return "classList";
    }
}
