package cn.allene.school.controller;

import cn.allene.school.po.Admin;
import cn.allene.school.po.condition.AdminCondition;
import cn.allene.school.services.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController<Admin, Integer, AdminCondition, AdminService> {

    @RequestMapping("/")
    public String  _index(Model model, Admin admin){
        return "admin/index";
    }

    @RequestMapping("/login")
    public String login(Admin admin){
        return "admin/login";
    }
}
