package cn.allene.school.controller;

import cn.allene.school.annatation.AdminLogin;
import cn.allene.school.annatation.Prefix;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Child;
import cn.allene.school.po.Class;
import cn.allene.school.po.condition.ChildCondition;
import cn.allene.school.po.condition.ClassCondition;
import cn.allene.school.services.ChildService;
import cn.allene.school.services.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/class")
@Prefix("admin/class/")
public class ClassController extends BaseController<Class, Integer, ClassCondition, ClassService> {

    @Autowired
    private ChildService childService;

    @RequestMapping("/list")
    @Prefix(appenPrefix = false)
    public String list() throws SchoolException {

        List<Class> classList = this.getService().queryList(new ClassCondition());
        getModel().addAttribute(classList);
        return "classList";
    }

    @RequestMapping("/{classId}")
    @Prefix(appenPrefix = false)
    public String _index(@PathVariable("classId") Integer classId) throws SchoolException {
        List<Child> childList = childService.queryList(new ChildCondition(classId));

        List<Class> classList = this.getService().queryList(new ClassCondition());

        getModel().addAttribute("classList", classList);
        getModel().addAttribute("childList", childList);
        return "index";
    }

    @RequestMapping("/photo/{classId}")
    @Prefix(appenPrefix = false)
    public String photoList(@PathVariable("classId")Integer classId){
        return "photoList";
    }

    @RequestMapping("/child/{classId}")
    @Prefix(appenPrefix = false)
    public String childList(@PathVariable("classId")Integer classId){
        return "childList";
    }



    @RequestMapping("/manage/list")
    @AdminLogin
    public String classList() throws SchoolException {
        List<Class> classList = this.getService().queryList(new ClassCondition());
        getModel().addAttribute("classList", classList);
        return "list";
    }

    @RequestMapping(value = {"/manage/addPage", "/manage/editPage"})
    @AdminLogin
    public String addPage() throws SchoolException {
        if(this.getPo().getId() != null){
            this.getModel().addAttribute("class", getService().query(this.getPo().getId()));
        }
        return "add_class";
    }

    @RequestMapping(value = {"/manage/add", "/manage/edit"})
    @AdminLogin
    public String addAndEdit() throws SchoolException {
        if(this.getPo().getId() != null){
            this.getService().updateOrInsert(this.getCondition(), this.getPo());
        }
        return "add_class";
    }
}
