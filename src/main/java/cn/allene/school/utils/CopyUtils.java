package cn.allene.school.utils;

import org.springframework.beans.BeanUtils;
import org.springframework.cglib.beans.BeanMap;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;
import java.util.stream.Collectors;

/**
 * create by KKYV on 2018-03-19
 */
public class CopyUtils {
    public static <T> T transfer(Object source, Class<T> tClass){
        if (source == null) {
            return null;
        } else {
            try {
                T t = tClass.newInstance();
                BeanUtils.copyProperties(source, t);
                return t;
            } catch (InstantiationException var3) {
                var3.printStackTrace();
                return null;
            } catch (IllegalAccessException var4) {
                var4.printStackTrace();
                return null;
            }
        }
    }

    public static <T> List<T> transfer(List<?> sourceList, Class<T> targetClass) {
        return (List)(CollectionUtils.isEmpty(sourceList) ? new ArrayList() : sourceList.stream().map(source -> transfer(source, targetClass)).collect(Collectors.toList()));
    }

    public static  <T, S> void transfer(List<? extends T> targetList, List<? extends S> sourceList, BiFunction<? super S, ? super  T, Boolean> testFunction){

        if(!CollectionUtils.isEmpty(sourceList)){
            for(T t : targetList){
                for(S s : sourceList){
                    if(testFunction.apply(s, t).booleanValue()){
                        BeanUtils.copyProperties(s, t);
                        break;
                    }
                }
            }
        }
    }

    public static <S, T> List<Map<String, String>> toMap(List<? extends S> sourceList, List<? extends T> targetClass, BiFunction<? super S, ? super  T, Boolean> testFunction){
        List<Map<String, String>> list = new ArrayList<>();
        for(T t : targetClass){
            Map<String, String> map = new HashMap<>();
            BeanMap beanMap = BeanMap.create(t);
            map.putAll(beanMap);
            for(S s : sourceList){
                if(testFunction.apply(s, t).booleanValue()){
                    beanMap = BeanMap.create(t);
                    map.putAll(beanMap);
                }
            }
            list.add(beanMap);
        }
        return list;
    }
}
