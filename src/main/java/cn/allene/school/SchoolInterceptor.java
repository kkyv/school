package cn.allene.school;

import cn.allene.school.annatation.AdminLogin;
import cn.allene.school.annatation.Prefix;
import cn.allene.school.contacts.Contacts;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SchoolInterceptor implements HandlerInterceptor {
    /*
    拦截需要登录的url
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HandlerMethod handlerMethod = (HandlerMethod) o;
        if(handlerMethod.getMethod().isAnnotationPresent(AdminLogin.class)){
            if(handlerMethod.getMethodAnnotation(AdminLogin.class).requireLogin()){
                Object admin = httpServletRequest.getSession().getAttribute(Contacts.Session.ADMIN);
                if(admin == null){
                    httpServletRequest.getSession().setAttribute("prePage", httpServletRequest.getRequestURI());
                    httpServletResponse.sendRedirect("/admin/login");
                    return false;
                }
            }
        }
       return true;
    }

    /*
    多视图前缀
     */
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler, ModelAndView modelAndView) throws Exception {
        if(null != modelAndView){   //处理没有modelview的
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            String prefix = "";
            if(handlerMethod.getMethod().isAnnotationPresent(Prefix.class)){
               prefix += handlerMethod.getMethod().getAnnotation(Prefix.class).value();
            }else if(handlerMethod.getBeanType().isAnnotationPresent(Prefix.class)){
                prefix = handlerMethod.getBeanType().getAnnotation(Prefix.class).value() + prefix;
            }
            modelAndView.setViewName(prefix + modelAndView.getViewName());
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
