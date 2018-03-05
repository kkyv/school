package cn.allene.school;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;

@SpringBootApplication
//@ComponentScan(value = {"cn.allene.school.controller", "cn.allene.school.service"})
@MapperScan("cn.allene.school.dao")
//public class SchoolApplication{
//tomcat启动
public class SchoolApplication extends SpringBootServletInitializer{
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder  builder) {
        return builder.sources(SchoolApplication.class);
    }

	public static void main(String[] args) {
		SpringApplication.run(SchoolApplication.class, args);
	}

}
