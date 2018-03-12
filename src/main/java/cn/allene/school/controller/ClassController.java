package cn.allene.school.controller;

import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Child;
import cn.allene.school.po.Class;
import cn.allene.school.po.condition.ChildCondition;
import cn.allene.school.po.condition.ClassCondition;
import cn.allene.school.services.ChildService;
import cn.allene.school.services.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/class")
public class ClassController extends BaseController<Class, Integer, ClassCondition, ClassService> {

    @Autowired
    private ChildService childService;

    @RequestMapping("/list")
    public String list(Model model) throws SchoolException {
        this.queryCate(model);

        List<Class> classList = this.queryList(new ClassCondition());
        model.addAttribute(classList);
        return "classList";
    }

    @RequestMapping("/{classId}")
    public String _index(Model model, @PathVariable("classId") Integer classId) throws SchoolException {
        List<Child> childList = childService.queryList(new ChildCondition(classId));

        List<Class> classList = this.queryList(new ClassCondition());

        model.addAttribute("classList", classList);
        model.addAttribute("childList", childList);
        return "class/index";
    }

    @RequestMapping("/photo/{classId}")
    public String photoList(@PathVariable("classId")Integer classId){
        return "class/photoList";
    }

    @RequestMapping("/child/{classId}")
    public String childList(@PathVariable("classId")Integer classId){
        return "class/childList";
    }
}
