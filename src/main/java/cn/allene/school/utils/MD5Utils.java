package cn.allene.school.utils;

import org.springframework.util.DigestUtils;

public class MD5Utils {
    public static String MD5(String pwd){
        return DigestUtils.md5DigestAsHex(pwd.getBytes());
    }
}
