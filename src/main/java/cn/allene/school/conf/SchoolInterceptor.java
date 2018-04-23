package cn.allene.school.conf;

import cn.allene.school.annatation.AdminLogin;
import cn.allene.school.annatation.Prefix;
import cn.allene.school.contacts.Contacts;
import cn.allene.school.po.Access;
import cn.allene.school.po.Admin;
import cn.allene.school.po.Role;
import cn.allene.school.po.condition.AccessCondition;
import cn.allene.school.services.AccessService;
import cn.allene.school.services.RoleService;
import cn.allene.school.utils.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class SchoolInterceptor implements HandlerInterceptor {
    /*
    拦截需要登录的url
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws IOException {
        int status = httpServletResponse.getStatus();
        // TODO: 2018/3/8 取消每次登陆  待删除
//        if(httpServletRequest.getSession().getAttribute(Contacts.Session.ADMIN) == null){
//            Admin admin1 = new Admin();
//            admin1.setId(123);
//            admin1.setRoleId(3);
//            httpServletRequest.getSession().setAttribute(Contacts.Session.ADMIN, admin1);
////        }

        HandlerMethod handlerMethod = (HandlerMethod) o;
        AdminLogin adminLogin = handlerMethod.getMethodAnnotation(AdminLogin.class);
        if(adminLogin != null){
            Admin admin = (Admin) httpServletRequest.getSession().getAttribute(Contacts.Session.ADMIN);
            if(admin == null){
                //需登录记住上一次请求
                httpServletRequest.getSession().setAttribute("prePage", httpServletRequest.getRequestURI());
                httpServletResponse.sendRedirect("/admin/login");
                return false;
            }
        }

        return true;
    }

    @Autowired
    private RoleService roleService;
    @Autowired
    private AccessService accessService;

    public SchoolInterceptor(RoleService roleService, AccessService accessService) {
        this.roleService = roleService;
        this.accessService = accessService;
    }

    /*
        多视图前缀
         */
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler, ModelAndView modelAndView) throws Exception {
        //权限拦截
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        AdminLogin adminLogin = handlerMethod.getMethod().getAnnotation(AdminLogin.class);
        if(adminLogin != null && adminLogin.interceptor()){
            Admin admin = (Admin) httpServletRequest.getSession().getAttribute(Contacts.Session.ADMIN);
            if(admin != null){
                Role role = roleService.query(admin.getRoleId());
                List<Integer> accessIdList = Stream.of(role.getAccess().split(",")).map(m -> Integer.valueOf(m)).collect(Collectors.toList());

                String[] mappingList = httpServletRequest.getRequestURI().split("/");
                AccessCondition accessCondition = new AccessCondition();
                accessCondition.setModel(mappingList[1]);
                accessCondition.setGroup(mappingList[2]);
                accessCondition.setAccess(mappingList[3]);
                accessCondition.setState(Contacts.State.Yes);
                List<Access> accessList = accessService.queryList(accessCondition);
                if(CollectionUtils.isNotEmpty(accessList)){
                    if(!accessIdList.contains(accessList.get(0).getId())){
                        modelAndView.setViewName("admin/index");
                        return;
                    }
                }
            }
}

        if(null != modelAndView){   //处理没有modelview的
            if(!modelAndView.getViewName().contains("redirect")){
                String prefix = "";
                if(handlerMethod.getBeanType().isAnnotationPresent(Prefix.class)){
                    if((handlerMethod.getMethod().isAnnotationPresent(AdminLogin.class) || handlerMethod.getBeanType().isAnnotationPresent(AdminLogin.class)) && handlerMethod.getMethodAnnotation(AdminLogin.class).appendPrefix()){
                        String tep = handlerMethod.getBeanType().getAnnotation(Prefix.class).value();
                        prefix += tep;
                    }

                    if(handlerMethod.getMethod().isAnnotationPresent(Prefix.class)){
                        prefix += handlerMethod.getMethod().getAnnotation(Prefix.class).value();
                    }
                }
                modelAndView.setViewName(prefix + modelAndView.getViewName());
            }
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    }
}
