package cn.allene.school;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.WebMvcAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;

@SpringBootApplication
//@ComponentScan(value = {"cn.allene.school.controller", "cn.allene.school.service"})
@MapperScan("cn.allene.school.dao")
//tomcat启动(必须继承自SpringBootServletInitializer)
public class SchoolApplication extends SpringBootServletInitializer{
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder  builder) {
        return builder.sources(SchoolApplication.class);
    }

	public static void main(String[] args) {
		SpringApplication.run(SchoolApplication.class, args);
	}

}
