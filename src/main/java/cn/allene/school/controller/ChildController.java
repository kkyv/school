package cn.allene.school.controller;

import cn.allene.school.annatation.AdminLogin;
import cn.allene.school.annatation.Prefix;
import cn.allene.school.contacts.Contacts;
import cn.allene.school.exp.AjaxException;
import cn.allene.school.po.Class;
import cn.allene.school.po.condition.ChildCondition;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Child;
import cn.allene.school.po.condition.ClassCondition;
import cn.allene.school.services.ChildService;
import cn.allene.school.services.ClassService;
import cn.allene.school.utils.MD5Utils;
import cn.allene.school.vo.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/child")
@Prefix("admin/class/")
public class ChildController extends BaseController<Child, String, ChildCondition, ChildService>{

    @Autowired
    private ClassService classService;

    @RequestMapping("/login")
    @ResponseBody
    public AjaxResult<Child> login(HttpSession session, Child child) throws SchoolException {
        ChildCondition childCondition = new ChildCondition();
        childCondition.setId(child.getId());
        childCondition.setPassword(MD5Utils.MD5(child.getPassword()));
        List<Child> childList = this.getService().queryList(childCondition);
        AjaxResult<Child> ajaxResult = null;
        if(CollectionUtils.isEmpty(childList)){
            ajaxResult = new AjaxResult<>(false, "用户名或密码错误");
        }else{
            session.setAttribute(Contacts.Session.CHILD, childList.get(0));
            ajaxResult = new AjaxResult<>(true, childList.get(0));
        }
        return ajaxResult;
    }

    @RequestMapping("/logout/{id}")
    public String logout(HttpSession session, @PathVariable("id") String id){
        session.removeAttribute(Contacts.Session.CHILD);
        return "redirect:/";
    }

    @RequestMapping("/child/list")
    @AdminLogin
    public String list(ChildCondition childCondition) throws SchoolException {
        childCondition.setState(null);
        List<Child> childList = this.getService().queryList(childCondition);
        this.getModel().addAttribute("childList", childList);
        List<Class> classList = classService.queryList(new ClassCondition());
        Map<String, Class> classMap = classList.stream().collect(Collectors.toMap(m -> String.valueOf(m.getId()), Function.identity()));
        this.getModel().addAttribute("classMap", classMap);
        return "child_list";
    }

    @RequestMapping("/child/changeState")
    @AdminLogin
    @ResponseBody
    public AjaxResult stateChange(Child child) throws AjaxException {
        try {
            this.getService().update(child);
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping({"/child/addPage","/child/editPage"})
    @AdminLogin
    public String addPage(Child child) throws SchoolException {
        if(child.getId() != null){
            child = this.getService().query(child.getId());
            this.getModel().addAttribute("child", child);
        }
        List<Class> classList = classService.queryList(new ClassCondition());
        this.getModel().addAttribute(classList);
        return "child_add";
    }



    @RequestMapping({"/child/show"})
    @AdminLogin
    public String show(Child child) throws SchoolException {
        if(child.getId() != null){
            child = this.getService().query(child.getId());
            this.getModel().addAttribute("child", child);
        }
        return "child_show";
    }

    @RequestMapping("/child/add")
    @AdminLogin
    @ResponseBody
    public AjaxResult add(Child child) throws AjaxException {
        try {
            child.setAddTime(new Date());
            child.setPassword(MD5Utils.MD5(child.getPassword()));
            ChildCondition childCondition = new ChildCondition();
            childCondition.setId(child.getId());
            this.getService().updateOrInsert(childCondition, child);
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/child/edit")
    @AdminLogin
    @ResponseBody
    public AjaxResult edit(Child child) throws AjaxException {
        try {
            child.setPassword(MD5Utils.MD5(child.getPassword()));
            this.getService().update(child);
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/child/del")
    @AdminLogin
    @ResponseBody
    public AjaxResult del(Child child) throws AjaxException {
        try {
            this.getService().delete(child.getId());
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/child/rePwd")
    @AdminLogin
    public String rePwd() throws SchoolException{
        Child child = this.getService().query("20180107001");
        this.getModel().addAttribute("child", child);
        return "child_change_pwd";
    }
}
