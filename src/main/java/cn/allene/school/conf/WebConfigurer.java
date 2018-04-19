package cn.allene.school.conf;

import cn.allene.school.services.AccessService;
import cn.allene.school.services.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebConfigurer extends WebMvcConfigurerAdapter {

    @Autowired
    private RoleService roleService;

    @Autowired
    private AccessService accessService;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new SchoolInterceptor(roleService, accessService)).addPathPatterns("/**");
        super.addInterceptors(registry);
    }


}
