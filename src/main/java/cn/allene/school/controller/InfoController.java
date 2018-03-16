package cn.allene.school.controller;

import cn.allene.school.contacts.InfoCateEnum;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.Info;
import cn.allene.school.po.InfoCate;
import cn.allene.school.po.condition.InfoCondition;
import cn.allene.school.services.InfoCateService;
import cn.allene.school.services.InfoService;
import cn.allene.school.utils.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/info")
@Controller
public class InfoController extends BaseController<Info, Integer, InfoCondition, InfoService> {

    @Autowired
    private InfoCateService infoCateService;

    @RequestMapping("/list/{cateId}")
    public String queryList( @PathVariable("cateId") Integer cateId) throws SchoolException {
        this.queryCate();

        if(cateId.equals(InfoCateEnum.CATE_14.getId())){
            return "redirect:/class/list";
        }

        List<Info> infoList = this.getService().queryList(new InfoCondition(cateId));
        getModel().addAttribute("infoList", infoList);
        if(infoList.size() == 1){
            return "info";
        }

        InfoCate infoCate = infoCateService.query(cateId);
        getModel().addAttribute("infoCate", infoCate);
        return "infoList";
    }

    @RequestMapping("/{id}")
    public String info( @PathVariable("id") Integer id) throws SchoolException {
        Info info = this.query(id);
        getModel().addAttribute("info", info);
        return "info";
    }
}
