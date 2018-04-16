package cn.allene.school.controller;

import cn.allene.school.annatation.AdminLogin;
import cn.allene.school.annatation.Prefix;
import cn.allene.school.contacts.Contacts;
import cn.allene.school.exp.AjaxException;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Msg;
import cn.allene.school.po.condition.MsgCondition;
import cn.allene.school.services.MsgService;
import cn.allene.school.vo.AjaxResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/bbs")
@Prefix("admin/msg/")
public class MsgController extends BaseController<Msg, Integer, MsgCondition, MsgService> {

    @RequestMapping("/")
    public String _index() throws SchoolException {
        List<Msg> msgList = this.getService().queryList(this.getCondition());
        this.getModel().addAttribute("msgList", msgList);
        return "bbs";
    }

    @RequestMapping("/add")
    @ResponseBody
    public AjaxResult add() throws AjaxException {
        try {
            this.getPo().setTime(new Date());
            this.getService().insert(getPo());
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/msg/list")
    @AdminLogin
    public String list() throws SchoolException {
        this.getCondition().setStatus(null);
        List<Msg> msgList = this.getService().queryList(this.getCondition());
        this.getModel().addAttribute("msgList", msgList);
        return "msg_list";
    }

    @RequestMapping("/msg/changeState")
    @AdminLogin
    @ResponseBody
    public AjaxResult stateChange() throws AjaxException {
        try {
            this.getService().update(this.getPo());
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/msg/dels")
    @AdminLogin
    @ResponseBody
    public AjaxResult dels() throws AjaxException {
        try {
            for(Integer id : this.getCondition().getIdList()){
                this.getService().delete(id);
            }
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }
}
