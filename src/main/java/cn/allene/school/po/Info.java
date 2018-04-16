package cn.allene.school.po;

import java.io.Serializable;
import java.util.Date;

import cn.allene.school.contacts.Contacts;
import com.github.pagehelper.util.StringUtil;
import com.mongodb.DBObject;
import lombok.Data;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class Info implements Serializable{
    private String id;

    private String title;

    private String content;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date addTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date lastTime;

    private Integer total;

    private Integer cateId;

    private Integer cateGroup;

    /**
     * 0草稿 1发布
     */
    private Integer state = Contacts.State.Yes;

    public Update getUpdate(){
        Update update = new Update();
        if(StringUtil.isNotEmpty(title)){
            update.set("title", title);
        }
        if(StringUtil.isNotEmpty(content)) {
            update.set("content", content);
        }
        if(null != cateGroup) {
            update.set("cateGroup", cateGroup);
        }
        if(cateId != null){
            update.set("cateId", cateId);
        }
        if(lastTime != null){
            update.set("lastTime", lastTime);
        }
        if(total != null){
            update.set("total", total);
        }
        if(state != null){
            update.set("state", state);
        }
        return update;
    }
}