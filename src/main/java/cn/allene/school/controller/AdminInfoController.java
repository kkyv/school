package cn.allene.school.controller;

import cn.allene.school.annatation.AdminLogin;
import cn.allene.school.annatation.Prefix;
import cn.allene.school.contacts.InfoCateEnum;
import cn.allene.school.exp.AjaxException;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Info;
import cn.allene.school.po.InfoCate;
import cn.allene.school.po.condition.InfoCondition;
import cn.allene.school.services.InfoCateService;
import cn.allene.school.services.InfoService;
import cn.allene.school.utils.CollectionUtils;
import cn.allene.school.vo.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@RequestMapping("/info")
@Controller
@Prefix("admin/info/")
public class AdminInfoController extends BaseController<Info, String, InfoCondition, InfoService> {

    @RequestMapping("/{cateGroup}/infoList")
    @AdminLogin
    public String queryList( @PathVariable("cateGroup") String cateGroup) throws SchoolException {
        InfoCondition infoCondition = new InfoCondition();
        infoCondition.setCateGroup(cateGroup);
        List<Info> infoList = this.getService().queryList(infoCondition);
        getModel().addAttribute("infoList", infoList);
        return "infoList";
    }

    @RequestMapping({"/{cateGroup}/addInfoPage", "/{cateGroup}/editInfoPage"})
    @AdminLogin
    public String info(@PathVariable("cateGroup") String cateGroup) throws SchoolException {
        if(this.getPo().getId() != null){
            Info info = this.getService().query(this.getPo().getId());
            this.getModel().addAttribute("info", info);
        }
        return "info_add";
    }

    @RequestMapping("/{cateGroup}/edit")
    @AdminLogin
    @ResponseBody
    public AjaxResult edit(@PathVariable("cateGroup") String cateGroup) throws AjaxException {
        try {
            this.getPo().setCateGroup(cateGroup);
            this.getService().update(this.getPo());
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/{cateGroup}/del")
    @AdminLogin
    @ResponseBody
    public AjaxResult del(@PathVariable("cateGroup") String cateGroup) throws AjaxException {
        try {
            this.getService().delete(this.getPo().getId());
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/{cateId}/add")
    @AdminLogin
    @ResponseBody
    public AjaxResult add(@PathVariable Integer cateId) throws AjaxException {
        try {
            Info info = this.getPo();
            info.setCateId(cateId);
            info.setAddTime(new Date());
            info.setLastTime(new Date());
            info.setTotal(0);
            this.getService().insert(info);
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }
}
