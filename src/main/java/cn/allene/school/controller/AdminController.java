package cn.allene.school.controller;

import cn.allene.school.annatation.AdminLogin;
import cn.allene.school.annatation.Prefix;
import cn.allene.school.contacts.Contacts;
import cn.allene.school.exp.AjaxException;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Admin;
import cn.allene.school.po.AdminRole;
import cn.allene.school.po.Role;
import cn.allene.school.po.RoleAccess;
import cn.allene.school.po.condition.AdminCondition;
import cn.allene.school.po.condition.RoleAccessCondition;
import cn.allene.school.po.condition.RoleCondition;
import cn.allene.school.services.AdminService;
import cn.allene.school.services.RoleAccessService;
import cn.allene.school.services.RoleService;
import cn.allene.school.utils.CollectionUtils;
import cn.allene.school.utils.MD5Utils;
import cn.allene.school.vo.AdminRoleVo;
import cn.allene.school.vo.AjaxResult;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
@Prefix("admin/")
public class AdminController extends BaseController<Admin, Integer, AdminCondition, AdminService> {
    @Autowired
    private RoleService roleService;
    @Autowired
    private RoleAccessService roleAccessService;


    @RequestMapping("/login")
    public String login() throws SchoolException {
        if(getPo().getId() == null){
            return "login";
        }

        AdminCondition adminCondition = new AdminCondition();
        adminCondition.setId(getPo().getId());
        adminCondition.setPassword(MD5Utils.MD5(getPo().getPassword()));
        List<Admin> adminList = this.getService().queryList(adminCondition);
        if(CollectionUtils.isEmpty(adminList)){
            return "login";
        }

        String prePage = (String) getRequest().getSession().getAttribute("prePage");
        this.getRequest().getSession().setAttribute(Contacts.Session.ADMIN, this.getPo());
        if(!StringUtils.isEmpty(prePage)){
            return "redirect:" + prePage;
        }else{
            return "index";
        }
    }

    @RequestMapping("/index")
    public String index() {
        return "admin/index";
    }

    @RequestMapping("/addRolePage")
    @AdminLogin
    public String addRolePage(){
        return "admin/role_add";
    }
    @RequestMapping("/access")
    @AdminLogin
    public String access(){
        return "admin/admin_access";
    }
    @RequestMapping("/")
    @AdminLogin
    public String  _index(){
        return "admin/index";
    }


    @RequestMapping("/list")
    @AdminLogin
    public String list(){
        return "admin/admin_list";
    }

    @RequestMapping("/role")
    @AdminLogin
    public String role() throws SchoolException {
        List<Role> roleList = roleService.queryList(new RoleCondition());
        List<Integer> roleIdList = roleList.stream().map(Role::getId).collect(Collectors.toList());

        AdminCondition adminCondition = new AdminCondition();
        adminCondition.setRoleIdList(roleIdList);
        List<Admin> adminList = this.getService().queryList(adminCondition);
        Map<Integer, List<Admin>> adminMap = adminList.stream().collect(Collectors.groupingBy(Admin::getRoleId));
        this.getService().queryList(adminCondition);

        List<AdminRoleVo> adminRoleList = roleList.stream().map(m -> {
            AdminRoleVo adminRoleVo = new AdminRoleVo();
            adminRoleVo.setRole(m);
            adminRoleVo.setAdminList(adminMap.get(m.getId()));
            return adminRoleVo;
        }).collect(Collectors.toList());

        this.getModel().addAttribute("adminRoleList", adminRoleList);

        return "admin/admin_role";
    }

    @RequestMapping("/delRole")
    @AdminLogin
    @ResponseBody
    public AjaxResult delRole() throws AjaxException {
        this.getService().delRole(this.getCondition().getRoleIdList());
        return new AjaxResult();
    }


    @RequestMapping("/addRole")
    @AdminLogin
    public AjaxResult addRole() throws AjaxException{
        try {
            this.getService().insert(this.getPo());
        } catch (SchoolException e) {
            throw new AjaxException();
        }
        return new AjaxResult();
    }
}
