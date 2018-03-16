package cn.allene.school.controller;

import cn.allene.school.annatation.AdminLogin;
import cn.allene.school.annatation.Prefix;
import cn.allene.school.po.Admin;
import cn.allene.school.po.condition.AdminCondition;
import cn.allene.school.services.AdminService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
@Prefix("admin/manage/")
public class AdminController extends BaseController<Admin, Integer, AdminCondition, AdminService> {

    @RequestMapping("/")
    @Prefix("admin/")
    public String  _index(Admin admin){
        return "index";
    }

    @RequestMapping("/login")
    @Prefix("admin/")
    public String login(Admin admin){
        System.out.println(getRequest().getSession().getAttribute("prePage"));
        return "login";
    }

    @RequestMapping("/list")
    @AdminLogin(requireLogin = true)
    public String list(){
        return "admin_list";
    }

    @RequestMapping("/role")
    public String role(){
        return "admin_role";
    }

    @RequestMapping("/access")
    public String access(){
        return "admin/manage/admin_access";
    }
}
