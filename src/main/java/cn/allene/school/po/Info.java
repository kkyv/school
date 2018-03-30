package cn.allene.school.po;

import java.io.Serializable;
import java.util.Date;

import com.github.pagehelper.util.StringUtil;
import com.mongodb.DBObject;
import lombok.Data;
import org.springframework.data.mongodb.core.query.Update;

@Data
public class Info implements Serializable{
    private String id;

    private String title;

    private String content;

    private Date addTime;

    private Date lastTime;

    private Integer total;

    private Integer cateId;

    public Update getUpdate(){
        Update update = new Update();
        if(StringUtil.isNotEmpty(title)){
            update.addToSet("title", title);
        }
        if(StringUtil.isNotEmpty(content)) {
            update.addToSet("content", content);
        }
        if(cateId != null){
            update.addToSet("cateId", cateId);
        }
        if(lastTime != null){
            update.addToSet("cateId", cateId);
        }
        if(total != null){
            update.addToSet("total", total);
        }
        return update;
    }
}