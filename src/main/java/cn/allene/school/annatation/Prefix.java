package cn.allene.school.annatation;

import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface Prefix {
    String value() default "";

    boolean appenPrefix() default true;
}
