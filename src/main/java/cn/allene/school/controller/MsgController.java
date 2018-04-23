package cn.allene.school.controller;

import cn.allene.school.annatation.AdminLogin;
import cn.allene.school.annatation.Prefix;
import cn.allene.school.contacts.Contacts;
import cn.allene.school.exp.AjaxException;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Child;
import cn.allene.school.po.Class;
import cn.allene.school.po.Msg;
import cn.allene.school.po.condition.ClassCondition;
import cn.allene.school.po.condition.MsgCondition;
import cn.allene.school.services.ClassService;
import cn.allene.school.services.MsgService;
import cn.allene.school.vo.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/bbs")
@Prefix("admin/msg/")
public class MsgController extends BaseController<Msg, Integer, MsgCondition, MsgService> {

    @Autowired
    private ClassService classService;

    @RequestMapping("/")
    public String _index(MsgCondition msgCondition) throws SchoolException {
        List<Msg> msgList = this.getService().queryList(msgCondition);
        this.getModel().addAttribute("msgList", msgList);
        return "bbs";
    }

    @RequestMapping("/add")
    public String add(HttpSession httpSession, Msg msg) throws SchoolException {
        msg.setTime(new Date());
        this.getService().insert(msg);
        if(!msg.getType().equals(Contacts.MsgTpye.INDEX)){
            return "redirect:/class/bbs/"+msg.getType();
        }
        return "redirect:/bbs/";
    }

    @RequestMapping("/ajaxAdd")
    @ResponseBody
    public AjaxResult ajaxAdd(HttpSession httpSession, Msg msg) throws AjaxException {
        try {
            this.getService().insert(msg);
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/phonePage")
    public String phonePage(HttpSession httpSession) throws AjaxException {
        return "live_phone";
    }

    @RequestMapping("/msg/list")
    @AdminLogin
    public String list(MsgCondition msgCondition) throws SchoolException {
        msgCondition.setStatus(null);
        msgCondition.setType(Contacts.MsgTpye.INDEX);
        List<Msg> msgList = this.getService().queryList(msgCondition);
        this.getModel().addAttribute("msgList", msgList);
        return "msg_list";
    }

    @RequestMapping("/class/list")
    @AdminLogin
    public String classList(MsgCondition msgCondition) throws SchoolException {
        msgCondition.setStatus(null);
        msgCondition.setType(Contacts.MsgTpye.CLASS);
        List<Msg> msgList = this.getService().queryList(msgCondition);
        this.getModel().addAttribute("msgList", msgList);

        List<Class> classList = classService.queryList(new ClassCondition());
        Map<String, Class> classMap = classList.stream().collect(Collectors.toMap(m -> String.valueOf(m.getId()), Function.identity()));
        this.getModel().addAttribute("classMap", classMap);
        return "class_msg";
    }

    @RequestMapping("/msg/changeState")
    @AdminLogin
    @ResponseBody
    public AjaxResult stateChange(Msg msg) throws AjaxException {
        try {
            this.getService().update(msg);
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/msg/dels")
    @AdminLogin
    @ResponseBody
    public AjaxResult dels(MsgCondition msgCondition) throws AjaxException {
        try {
            for(Integer id : msgCondition.getIdList()){
                this.getService().delete(id);
            }
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }
}
