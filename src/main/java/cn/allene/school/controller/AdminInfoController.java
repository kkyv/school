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
import com.github.pagehelper.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RequestMapping("/info")
@Controller
@Prefix("admin/info/")
public class AdminInfoController extends BaseController<Info, String, InfoCondition, InfoService> {

    @RequestMapping("/{cateGroup}/infoList")
    @AdminLogin
    public String queryList( @PathVariable Integer cateGroup) throws SchoolException {
        InfoCondition infoCondition = this.getCondition();
        infoCondition.setCateGroup(cateGroup);
        infoCondition.setState(null);
        List<Info> infoList = this.getService().queryList(infoCondition);
        getModel().addAttribute("infoList", infoList);
        return "info_list";
    }

    @RequestMapping({"/{cateGroup}/addInfoPage", "/{cateGroup}/editInfoPage"})
    @AdminLogin
    public String addInfoPage(@PathVariable Integer cateGroup, String infoId) throws SchoolException {
        if(StringUtil.isNotEmpty(infoId)){
            Info info = this.getService().query(infoId);
            this.getModel().addAttribute("info", info);
        }
        return "info_add";
    }

    @RequestMapping("/detail/{infoId}")
    @AdminLogin
    public String detail(@PathVariable String infoId) throws SchoolException {
        Info info = this.getService().query(infoId);
        this.getModel().addAttribute("infoDetail", info);
        return "info_detail";
    }

    @RequestMapping("/{cateGroup}/edit")
    @AdminLogin
    @ResponseBody
    public AjaxResult edit(@PathVariable Integer cateGroup, String infoId) throws AjaxException {
        try {
            this.getPo().setId(infoId);
            this.getPo().setLastTime(new Date());
            this.getService().update(this.getPo());
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/{cateGroup}/del")
    @AdminLogin
    @ResponseBody
    public AjaxResult del(@PathVariable Integer cateGroup, String infoId) throws AjaxException {
        try {
            this.getService().delete(infoId);
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/{cateGroup}/add")
    @AdminLogin
    @ResponseBody
    public AjaxResult add(@PathVariable Integer cateGroup) throws AjaxException {
        try {
            Info info = this.getPo();
            info.setId(null);
            info.setCateGroup(cateGroup);
            info.setAddTime(new Date());
            info.setLastTime(new Date());
            info.setTotal(0);
            this.getService().insert(info);
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/{cateGroup}/changeState")
    @AdminLogin
    @ResponseBody
    public AjaxResult stateChange(@PathVariable Integer cateGroup, String infoId) throws AjaxException {
        try {
            this.getPo().setId(infoId);
            this.getPo().setCateGroup(null);
            this.getService().update(this.getPo());
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }
}
