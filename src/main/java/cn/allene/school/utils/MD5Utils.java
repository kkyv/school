package cn.allene.school.utils;

import org.springframework.util.DigestUtils;

import java.io.File;

public class MD5Utils {
    public static String MD5(String pwd){
        return MD5(pwd.getBytes());
    }

    public static String MD5(byte[] bytes){
        return DigestUtils.md5DigestAsHex(bytes);
    }
}
