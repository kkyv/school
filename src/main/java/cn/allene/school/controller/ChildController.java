package cn.allene.school.controller;

import cn.allene.school.po.condition.ChildCondition;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Child;
import cn.allene.school.services.ChildService;
import cn.allene.school.utils.MD5Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/child")
public class ChildController extends BaseController<Child, String, ChildCondition, ChildService>{

    @RequestMapping("/login")
    public String login(Model model, Child child) throws SchoolException {
        ChildCondition childCondition = new ChildCondition();
        childCondition.setId(child.getId());
        childCondition.setPassword(MD5Utils.MD5(child.getPassword()));
        List<Child> childList = this.getService().queryList(childCondition);
        if(CollectionUtils.isEmpty(childList)){
            throw new SchoolException("用户名或密码错误");
        }
        model.addAttribute("msg", "登陆成功");
        return "login";
    }

}
