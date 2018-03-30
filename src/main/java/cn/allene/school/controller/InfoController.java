package cn.allene.school.controller;

import cn.allene.school.annatation.AdminLogin;
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
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/info")
@Controller
public class InfoController extends BaseController<Info, String, InfoCondition, InfoService> {

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
    public String info( @PathVariable("id") String id) throws SchoolException {
        Info info = this.getService().query(id);
        getModel().addAttribute("info", info);
        return "info";
    }

    @RequestMapping("/yebj/infoList")
    @AdminLogin
    public String yebjInfoList(){
        return "admin/info/yebjInfoList";
    }

    @RequestMapping("/zszp/infoList")
    @AdminLogin
    public String zszpInfoList(){
        return "admin/info/zszpInfoList";
    }

    @RequestMapping("/infotest")
    @ResponseBody
    public int test() throws SchoolException {
//        Info info = new Info();
//        info.setAddTime(new Date());
//        info.setCateId(2);
//        info.setContent("123412541251");
//        info.setLastTime(new Date());
//        info.setTitle("1232541");
//        info.setTotal(0);
//        this.getService().insert(info);
//        InfoCondition infoCondition = new InfoCondition(2);
//        infoCondition.setContent("2333333");
        Info info = new Info();
        info.setId("5abdd5c522587e0ffc036051");
        info.setCateId(3);
        return this.getService().update(info);
    }
}
