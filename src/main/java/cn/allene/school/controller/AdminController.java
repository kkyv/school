package cn.allene.school.controller;

import cn.allene.school.annatation.AdminLogin;
import cn.allene.school.annatation.Prefix;
import cn.allene.school.contacts.Contacts;
import cn.allene.school.exp.AjaxException;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.*;
import cn.allene.school.po.condition.AccessCondition;
import cn.allene.school.po.condition.AdminCondition;
import cn.allene.school.po.condition.RoleAccessCondition;
import cn.allene.school.po.condition.RoleCondition;
import cn.allene.school.services.AccessService;
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
import java.util.stream.Stream;

@Controller
@RequestMapping("/admin/admin")
@Prefix("admin/")
@AdminLogin
public class AdminController extends BaseController<Admin, Integer, AdminCondition, AdminService> {
    @Autowired
    private RoleService roleService;
    @Autowired
    private RoleAccessService roleAccessService;
    @Autowired
    private AccessService accessService;

    @RequestMapping({"/addRolePage", "/editRolePage"})
    public String addRolePage() throws SchoolException {
        if(this.getPo().getId() != null){
            Role role = roleService.query(this.getPo().getId());
            this.getModel().addAttribute("role", role);
            if(!StringUtils.isEmpty(role.getAccess())){
                List<String> adminAccessList = Stream.of(role.getAccess().split(",")).collect(Collectors.toList());
                this.getModel().addAttribute("adminAccessList", adminAccessList);
            }
        }
        List<Access> accessList = accessService.queryList(new AccessCondition());
        Map<String, Map<String, List<Access>>> allAccessMap = accessList.stream().collect(Collectors.groupingBy(Access::getModel, Collectors.groupingBy(Access::getGroup)));
        this.getModel().addAttribute("allAccessMap", allAccessMap);
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

    @RequestMapping("/accessList")
    public String access(String name) throws SchoolException {
        AccessCondition accessCondition = new AccessCondition();
        accessCondition.setName(name);
        List<Access> accessList = accessService.queryList(accessCondition);
        this.getModel().addAttribute("accessList", accessList);
        //回显
        this.getModel().addAttribute("name", name);
        return "admin/admin_access";
    }
    @RequestMapping({"/", "/index"})
    public String  _index(){
        return "index";
    }

    @RequestMapping("/adminList")
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

    @RequestMapping("/adminDel")
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

    @RequestMapping("/roleList")
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

    @RequestMapping("/adminState")
    @ResponseBody
    public AjaxResult adminState() throws AjaxException{
        try {
            this.getService().update(this.getPo());
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/accessState")
    @ResponseBody
    public AjaxResult accessState(Access access) throws AjaxException{
        try {
            accessService.update(access);
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/roleDel")
    @ResponseBody
    public AjaxResult delRole() throws AjaxException {
        this.getService().delRole(this.getCondition().getRoleIdList());
        return new AjaxResult();
    }


    @RequestMapping("/addRole")
    @ResponseBody
    public AjaxResult addRole(Role role, String[] accesses) throws AjaxException{
        try {
            role.setAccess(org.apache.tomcat.util.buf.StringUtils.join(accesses));
            roleService.insert(role);
        } catch (SchoolException e) {
            throw new AjaxException();
        }
        return new AjaxResult();
    }

    @RequestMapping("/addAdmin")
    @ResponseBody
    public void addAdmin() throws SchoolException{
        this.getPo().setPassword(MD5Utils.MD5(this.getPo().getPassword()));
        this.getService().insert(this.getPo());
    }

    @RequestMapping("/editAdmin")
    @ResponseBody
    public void editAdmin() throws SchoolException{
        this.getPo().setPassword(MD5Utils.MD5(this.getPo().getPassword()));
        this.getService().update(this.getPo());
    }

    @RequestMapping("/editRole")
    @ResponseBody
    public AjaxResult editRole(String[] accesses, Role role) throws AjaxException {
        role.setAccess(org.apache.tomcat.util.buf.StringUtils.join(accesses));
        try {
            roleService.update(role);
        } catch (SchoolException e) {
            throw new AjaxException();
        }
        return new AjaxResult();
    }

}
