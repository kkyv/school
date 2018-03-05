package cn.allene.school.controller;

import cn.allene.school.po.condition.ChildCondition;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Child;
import cn.allene.school.services.ChildService;
import cn.allene.school.utils.MD5Utils;
import cn.allene.school.vo.AjaxResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/child")
public class ChildController extends BaseController<Child, String, ChildCondition, ChildService>{

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
            ajaxResult = new AjaxResult<>(true, childList.get(0));
            session.setAttribute("child", childList.get(0));
        }
        return ajaxResult;
    }

    @RequestMapping("/logout/{id}")
    public String logout(HttpSession session, @PathVariable("id") String id){
        session.removeAttribute("child");
        return "redirect:/";
    }

}
