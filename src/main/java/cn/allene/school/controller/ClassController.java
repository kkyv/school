package cn.allene.school.controller;

import cn.allene.school.annatation.AdminLogin;
import cn.allene.school.annatation.Prefix;
import cn.allene.school.contacts.Contacts;
import cn.allene.school.exp.AjaxException;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.*;
import cn.allene.school.po.Class;
import cn.allene.school.po.condition.*;
import cn.allene.school.services.*;
import cn.allene.school.utils.CollectionUtils;
import cn.allene.school.vo.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Controller
@RequestMapping("/class")
@Prefix("admin/class/")
public class ClassController extends BaseController<Class, Integer, ClassCondition, ClassService> {

    @Autowired
    private ChildService childService;
    @Autowired
    private MsgService msgService;
    @Autowired
    private AlbumService albumService;
    @Autowired
    private AlbumPhotoService albumPhotoService;
    @Autowired
    private AdminService adminService;

    @RequestMapping("/list")
    public String list() throws SchoolException {
        ClassCondition classCondition = new ClassCondition();
        classCondition.setState(Contacts.State.Yes);
        List<Class> classList = this.getService().queryList(classCondition);
        getModel().addAttribute(classList);
        return "classList";
    }

    @RequestMapping("/{classId}/album")
    public String album(HttpSession session, @PathVariable("classId") Integer classId) throws SchoolException {
        _index(classId, session);

        List<AlbumPhotoPo> albumPhotoPoList = albumPhotoService.queryList(new AlbumPhotoCondition());
        Map<String, Long> albumCountMap = albumPhotoPoList.stream().collect(Collectors.groupingBy(m -> String.valueOf(m.getAlbumId()), Collectors.counting()));
        this.getModel().addAttribute("albumCountMap", albumCountMap);
        return "class/albumList";
    }

    @RequestMapping("/{classId}/photo/{albumId}")
    public String photo(@PathVariable Integer albumId, HttpSession session, @PathVariable Integer classId) throws SchoolException {
        _index(classId, session);

        AlbumPhotoCondition albumPhotoCondition = new AlbumPhotoCondition();
        albumPhotoCondition.setAlbumId(albumId);
        List<AlbumPhotoPo> albumPhotoPoList = albumPhotoService.queryList(albumPhotoCondition);
        this.getModel().addAttribute("albumPhotoPoList", albumPhotoPoList);
        return "class/photoList";
    }

    @RequestMapping("/{classId}/bbs")
    public String bbs(HttpSession session, @PathVariable("classId") Integer classId) throws SchoolException {
        _index(classId, session);

        MsgCondition msgCondition = new MsgCondition();
        msgCondition.setType(classId);
        msgCondition.setStatus(Contacts.State.Yes);
        List<Msg> msgList = msgService.queryList(msgCondition);
        this.getModel().addAttribute("msgList", msgList);
        return "class/bbs";
    }

    @RequestMapping("/{classId}")
    public String _index(@PathVariable("classId") Integer classId, HttpSession session) throws SchoolException {
        Class aClass = this.getService().query(classId);
        if(aClass.getState() == Contacts.State.NO){
            return "class/index";
        }

        Child child = (Child) session.getAttribute(Contacts.Session.CHILD);
        String history = aClass.getHistory();
        if(child != null){
                history = (StringUtils.isEmpty(child.getNickname()) ? "匿名用户" : child.getNickname()) +
                        (StringUtils.isEmpty(history) ? "" : "," + history);

            List<String> hisList = Stream.of(history.split(",")).distinct().collect(Collectors.toList());
            Class c = new Class();
            c.setId(classId);
            c.setHistory(history);
            this.getService().update(c);
            aClass.setHistory(history);

            String his = org.apache.tomcat.util.buf.StringUtils.join(hisList.size() > 3 ? hisList.subList(0, 3) : hisList);
            aClass.setHistory(his);
        }

        ChildCondition childCondition = new ChildCondition(classId);
        childCondition.setPageSize(3);
        List<Child> childList = childService.queryList(childCondition);
        MsgCondition msgCondition = new MsgCondition();
        msgCondition.setType(Contacts.MsgTpye.INDEX);
        msgCondition.setPageSize(10);
        List<Msg> msgList = msgService.queryList(msgCondition);
        AlbumCondition albumCondition = new AlbumCondition();
        albumCondition.setCateName(aClass.getName());
        List<AlbumPo> albumPoList = albumService.queryList(albumCondition);
        if(CollectionUtils.isNotEmpty(albumPoList)){
            AlbumPhotoCondition albumPhotoCondition = new AlbumPhotoCondition();
            albumPhotoCondition.setAlbumIdList(albumPoList.stream().map(AlbumPo::getId).collect(Collectors.toList()));
            int photoCount = albumPhotoService.queryCount(albumPhotoCondition);
            this.getModel().addAttribute("photoCount", photoCount);
        }

        this.getModel().addAttribute("class", aClass);
        this.getModel().addAttribute("albumPoList", albumPoList);
        this.getModel().addAttribute("msgList",msgList);
        this.getModel().addAttribute("childList", childList);
        return "class/index";
    }

    @RequestMapping("/photo/{classId}")
    public String photoList(@PathVariable("classId")Integer classId){
        return "class/photoList";
    }

    @RequestMapping("/{classId}/child")
    public String childList(@PathVariable("classId")Integer classId, HttpSession session) throws SchoolException {
        _index(classId, session);
        return "class/childList";
    }



    @RequestMapping("/manage/list")
    @AdminLogin
    public String classList(ClassCondition classCondition) throws SchoolException {
        List<Class> classList = this.getService().queryList(classCondition);
        getModel().addAttribute("classList", classList);
        return "class_list";
    }

    @RequestMapping(value = {"/manage/addPage", "/manage/editPage"})
    @AdminLogin
    public String addPage(Class cla) throws SchoolException {
        AdminCondition adminCondition = new AdminCondition();
        List<Admin> adminList = adminService.queryList(adminCondition);
        this.getModel().addAttribute("adminList",adminList);

        if(cla.getId() != null){
            this.getModel().addAttribute("class", getService().query(cla.getId()));
        }
        return "class_add";
    }

    @RequestMapping(value = {"/manage/add", "/manage/edit"})
    @AdminLogin
    @ResponseBody
    public AjaxResult addAndEdit(ClassCondition classCondition, Class cla) throws AjaxException {
        try {
            ClassCondition classCondition1 = new ClassCondition();
            classCondition1.setId(cla.getId());
            this.getService().updateOrInsert(classCondition1, cla);
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/manage/changeState")
    @AdminLogin
    @ResponseBody
    public AjaxResult changeState(Class cla) throws AjaxException {
        try {
            this.getService().update(cla);
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/manage/el")
    @AdminLogin
    @ResponseBody
    public AjaxResult del(Class cla) throws AjaxException {
        try {
            this.getService().delete(cla.getId());
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }
}
