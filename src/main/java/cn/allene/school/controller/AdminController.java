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
import cn.allene.school.utils.CopyUtils;
import cn.allene.school.utils.MD5Utils;
import cn.allene.school.vo.AdminRoleNameVo;
import cn.allene.school.vo.AdminRoleVo;
import cn.allene.school.vo.AjaxResult;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
@Prefix("admin/")
@AdminLogin
public class AdminController extends BaseController<Admin, Integer, AdminCondition, AdminService> {
    @Autowired
    private RoleService roleService;
    @Autowired
    private RoleAccessService roleAccessService;

    @RequestMapping("/addRolePage")
    public String addRolePage(){
        return "admin/role_add";
    }
    @RequestMapping({"/addAdminPage", "/editAdminPage"})
    public String addAdminPage() throws SchoolException {
        if(this.getPo().getId() != null){
            Admin admin = this.getService().query(this.getPo().getId());
            this.getModel().addAttribute("admin", admin);
        }
        List<Role> roleList = roleService.queryList(new RoleCondition());
        this.getModel().addAttribute("roleList", roleList);
        return "admin/admin_add";
    }

    @RequestMapping("/access")
    public String access(){
        return "admin/admin_access";
    }
    @RequestMapping({"/", "/index"})
    public String  _index(){
        return "admin/index";
    }

    @RequestMapping("/list")
    public String list() throws SchoolException {
        List<Admin> adminList = this.getService().queryList(this.getCondition());
        List<AdminRoleNameVo> adminRoleNameList = new ArrayList<>();
        if(CollectionUtils.isNotEmpty(adminList)) {
            List<Integer> roleIdList = adminList.stream().map(Admin::getRoleId).collect(Collectors.toList());

            RoleCondition roleCondition = new RoleCondition();
            roleCondition.setIdList(roleIdList);
            List<Role> roleList = roleService.queryList(roleCondition);

            Map<Integer, String> roleNameMap = roleList.stream().collect(Collectors.toMap(Role::getId, Role::getName));

            adminRoleNameList = adminList.stream().map(m -> {
                AdminRoleNameVo adminRoleNameVo = CopyUtils.transfer(m, AdminRoleNameVo.class);
                adminRoleNameVo.setRoleName(roleNameMap.get(m.getRoleId()));
                return adminRoleNameVo;
            }).collect(Collectors.toList());
        }

        this.getModel().addAttribute("adminList", adminRoleNameList);

        return "admin/admin_list";
    }

    @RequestMapping("/del")
    @ResponseBody
    public AjaxResult del() throws AjaxException {
        try {
            for(Integer id : this.getCondition().getIdList()){
                this.getService().delete(id);
            }
        } catch (SchoolException e) {
            throw new AjaxException();
        }
        return new AjaxResult();
    }

    @RequestMapping("/role")
    public String role() throws SchoolException {
        List<Role> roleList = roleService.queryList(new RoleCondition());

        List<AdminRoleVo> adminRoleList = new ArrayList<>();

        if(CollectionUtils.isNotEmpty(roleList)){
            List<Integer> roleIdList = roleList.stream().map(Role::getId).collect(Collectors.toList());
            AdminCondition adminCondition = new AdminCondition();
            adminCondition.setRoleIdList(roleIdList);
            List<Admin> adminList = this.getService().queryList(adminCondition);
            Map<Integer, List<Admin>> adminMap = adminList.stream().collect(Collectors.groupingBy(Admin::getRoleId));
            this.getService().queryList(adminCondition);

            adminRoleList = roleList.stream().map(m -> {
                AdminRoleVo adminRoleVo = new AdminRoleVo();
                adminRoleVo.setRole(m);
                adminRoleVo.setAdminList(adminMap.get(m.getId()));
                return adminRoleVo;
            }).collect(Collectors.toList());
        }


        this.getModel().addAttribute("adminRoleList", adminRoleList);

        return "admin/admin_role";
    }

    @RequestMapping("/stateChange")
    @ResponseBody
    public AjaxResult stateChange() throws AjaxException{
        try {
            this.getService().update(this.getPo());
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/delRole")
    @ResponseBody
    public AjaxResult delRole() throws AjaxException {
        this.getService().delRole(this.getCondition().getRoleIdList());
        return new AjaxResult();
    }


    @RequestMapping("/addRole")
    public AjaxResult addRole() throws AjaxException{
        try {
            this.getService().insert(this.getPo());
        } catch (SchoolException e) {
            throw new AjaxException();
        }
        return new AjaxResult();
    }

    @RequestMapping("/add")
    public void add() throws SchoolException{
        this.getPo().setPassword(MD5Utils.MD5(this.getPo().getPassword()));
        this.getService().insert(this.getPo());
    }
}
