package cn.allene.school.conf;

import cn.allene.school.annatation.AdminLogin;
import cn.allene.school.annatation.Prefix;
import cn.allene.school.contacts.Contacts;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SchoolInterceptor implements HandlerInterceptor {
    /*
    拦截需要登录的url
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws IOException {
        int status = httpServletResponse.getStatus();
        // TODO: 2018/3/8 取消每次登陆  待删除
        if(httpServletRequest.getSession().getAttribute(Contacts.Session.ADMIN) == null){
            httpServletRequest.getSession().setAttribute(Contacts.Session.ADMIN, "123");
        }

        HandlerMethod handlerMethod = (HandlerMethod) o;
        if(handlerMethod.getBeanType().isAnnotationPresent(AdminLogin.class)){
            AdminLogin adminLogin = handlerMethod.getMethod().getAnnotation(AdminLogin.class);
            if(adminLogin == null || (adminLogin != null && adminLogin.requireLogin())){
                return checkLogin(httpServletRequest, httpServletResponse);
            }
        }else{
            if(handlerMethod.getMethod().getAnnotation(AdminLogin.class) != null && handlerMethod.getMethod().getAnnotation(AdminLogin.class).requireLogin()){
                return checkLogin(httpServletRequest, httpServletResponse);
            }
        }

       return true;
    }

    private boolean checkLogin(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException {
        Object admin = httpServletRequest.getSession().getAttribute(Contacts.Session.ADMIN);
        if(admin == null){
            //需登录记住上一次请求
            httpServletRequest.getSession().setAttribute("prePage", httpServletRequest.getRequestURI());
            httpServletResponse.sendRedirect("/admin/login");
            return false;
        }
        return true;
    }

    /*
    多视图前缀
     */
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler, ModelAndView modelAndView) throws Exception {
        if(null != modelAndView){   //处理没有modelview的
            if(!modelAndView.getViewName().contains("redirect")){
                HandlerMethod handlerMethod = (HandlerMethod) handler;
                String prefix = "";
                if(handlerMethod.getBeanType().isAnnotationPresent(Prefix.class)){
                    if(!(handlerMethod.getMethod().isAnnotationPresent(Prefix.class) && handlerMethod.getMethod().getAnnotation(Prefix.class).appenPrefix())){
                        String tep = handlerMethod.getBeanType().getAnnotation(Prefix.class).value();
                        prefix += tep;
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
