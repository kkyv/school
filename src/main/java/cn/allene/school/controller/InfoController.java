package cn.allene.school.controller;

import cn.allene.school.contacts.InfoCateEnum;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Info;
import cn.allene.school.po.InfoCate;
import cn.allene.school.po.condition.InfoCondition;
import cn.allene.school.services.InfoCateService;
import cn.allene.school.services.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/info")
@Controller
public class InfoController extends BaseController<Info, String, InfoCondition, InfoService> {

    @Autowired
    private InfoCateService infoCateService;

    @RequestMapping("/list/{cateId}")
    public String queryList( @PathVariable("cateId") Integer cateId) throws SchoolException {
        this.getModel().addAttribute("cateId", cateId);

        if(cateId.equals(InfoCateEnum.CATE_14.getId())){
            return "redirect:/class/list";
        }

        List<Info> infoList = this.getService().queryList(new InfoCondition(cateId));
        if(infoList.size() == 1){
            Info info = infoList.get(0);
            info.setTotal(info.getTotal() + 1);
            this.getService().asyncUpdate(info);
            this.getModel().addAttribute("info", info);
            return "info";
        }

        getModel().addAttribute("infoList", infoList);
        return "infoList";
    }

    @RequestMapping("/{id}")
    public String info( @PathVariable("id") String id) throws SchoolException {
        Info info = this.getService().query(id);
        //异步更新浏览
        info.setTotal(info.getTotal() + 1);
        this.getService().asyncUpdate(info);
        getModel().addAttribute("info", info);
        return "info";
    }
}
