package cn.allene.school.annatation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 登录校验
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface AdminLogin {
    boolean requireLogin() default true;

    boolean appendPrefix() default true;

    boolean interceptor() default true;
}
