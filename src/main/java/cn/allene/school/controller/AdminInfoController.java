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
    public String queryList(InfoCondition infoCondition, @PathVariable Integer cateGroup, Info info) throws SchoolException {
        infoCondition.setCateGroup(cateGroup);
        infoCondition.setState(null);
        List<Info> infoList = this.getService().queryList(infoCondition);
        getModel().addAttribute("infoList", infoList);
        return "info_list";
    }

    @RequestMapping({"/{cateGroup}/addInfoPage", "/{cateGroup}/editInfoPage"})
    @AdminLogin
    public String addInfoPage(@PathVariable Integer cateGroup, Info info) throws SchoolException {
        if(StringUtil.isNotEmpty(info.getId())){
            info = this.getService().query(info.getId());
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
    public AjaxResult edit(Info info, @PathVariable Integer cateGroup) throws AjaxException {
        this.getModel().addAttribute("cateGroup", cateGroup);

        try {
            info.setLastTime(new Date());
            this.getService().update(info);
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/{cateGroup}/del")
    @AdminLogin
    @ResponseBody
    public AjaxResult del(Info info, @PathVariable Integer cateGroup) throws AjaxException {
        this.getModel().addAttribute("cateGroup", cateGroup);

        try {
            this.getService().delete(info.getId());
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/{cateGroup}/add")
    @AdminLogin
    @ResponseBody
    public AjaxResult add(Info info, @PathVariable Integer cateGroup) throws AjaxException {
        this.getModel().addAttribute("cateGroup", cateGroup);

        try {
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
    public AjaxResult stateChange(Info info, @PathVariable Integer cateGroup, String infoId) throws AjaxException {
        this.getModel().addAttribute("cateGroup", cateGroup);

        try {
            info.setCateGroup(null);
            this.getService().update(info);
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }
}
