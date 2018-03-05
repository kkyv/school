package cn.allene.school.controller;

import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Child;
import cn.allene.school.po.Msg;
import cn.allene.school.po.condition.MsgCondition;
import cn.allene.school.services.MsgService;
import cn.allene.school.vo.AjaxResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/bbs")
public class MsgController extends BaseController<Msg, Integer, MsgCondition, MsgService> {

    @RequestMapping("/")
    public String _index(Model model) throws SchoolException {
        this.queryCate(model);
        return "bbs";
    }

    @RequestMapping("/add")
    @ResponseBody
    public AjaxResult<Msg> add(HttpSession session, Msg msg) {
        try {
            msg.setTime(new Date());
            this.insert(msg);
            return new AjaxResult<>(true, "留言成功，审核成功后即可查看");
        } catch (SchoolException e) {
            return new AjaxResult<>(false, "留言失败");
        }
    }
}
