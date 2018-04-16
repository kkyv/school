package cn.allene.school.controller;


import cn.allene.school.annatation.AdminLogin;
import cn.allene.school.annatation.Prefix;
import cn.allene.school.exp.AjaxException;
import cn.allene.school.exp.SchoolException;
import cn.allene.school.po.AlbumPhotoPo;
import cn.allene.school.po.AlbumPo;
import cn.allene.school.po.Class;
import cn.allene.school.po.condition.AlbumCondition;
import cn.allene.school.po.condition.AlbumPhotoCondition;
import cn.allene.school.po.condition.ClassCondition;
import cn.allene.school.services.AlbumPhotoService;
import cn.allene.school.services.AlbumService;
import cn.allene.school.services.ClassService;
import cn.allene.school.utils.CollectionUtils;
import cn.allene.school.vo.AjaxResult;
import cn.allene.school.vo.Editor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/album")
@Prefix("admin/album/")
public class AlbumController extends BaseController<AlbumPo, Integer, AlbumCondition, AlbumService>{

    private String uploadPath = "/Users/kkyv/devs/apache-tomcat-8.5.29/upload";

    private String uploadSuff = "/upload/";

    @Autowired
    private AlbumPhotoService albumPhotoService;
    @Autowired
    private ClassService classService;

    @RequestMapping("/uploadImg")
    @ResponseBody
    @Prefix(appenPrefix = false)
    public Editor uploadImg(@RequestParam("img") MultipartFile img, HttpServletRequest request, String cateGroupName) throws SchoolException {
        Editor editor = new Editor();
        try {
            editor.setData(Arrays.asList(toPhoto(img, cateGroupName)));
        } catch (IOException e) {
            e.printStackTrace();
            editor.setErrno(1);
        }

        return editor;
    }

    private String toPhoto(MultipartFile img, String albumName) throws IOException, SchoolException {
        String suff = img.getOriginalFilename().substring(img.getOriginalFilename().lastIndexOf("."));
        String uuid = UUID.randomUUID().toString();
        String fileName = uuid + suff;
        //查询相册
        AlbumCondition albumCondition = new AlbumCondition();
        albumCondition.setName(albumName);
        List<AlbumPo> albumPoList = this.getService().queryList(albumCondition);
        Integer albumId;
        if(CollectionUtils.isEmpty(albumPoList)){
            AlbumPo albumPo = new AlbumPo();
            albumPo.setName(albumName);
            albumPo.setAddTime(new Date());
            albumId = this.getService().insert(albumPo);
        }else{
            albumId = albumPoList.get(0).getId();
        }

        img.transferTo(new File(uploadPath, fileName));
        AlbumPhotoPo photoPo = new AlbumPhotoPo();
        photoPo.setAlbumId(albumId);
        photoPo.setPhotoId(fileName);
        photoPo.setAddTime(new Date());
        photoPo.setName(img.getOriginalFilename().substring(0, img.getOriginalFilename().lastIndexOf(".")));
        albumPhotoService.insert(photoPo);
        return uploadSuff + fileName;
    }

    @RequestMapping("/album/addPage")
    @AdminLogin
    public String addPage() throws SchoolException {
        List<Class> classList = classService.queryList(new ClassCondition());
        this.getModel().addAttribute("classList", classList);
        List<AlbumPo> albumPoList = this.getService().queryList(new AlbumCondition());
        this.getModel().addAttribute("albumNameList", albumPoList.stream().map(AlbumPo::getCateName).distinct().collect(Collectors.toList()));
        return "album_add";
    }

    @RequestMapping("/album/list")
    @AdminLogin
    public String albumList() throws SchoolException {
        List<AlbumPo> albumPoList = this.getService().queryList(new AlbumCondition());

        List<Integer> albumList = albumPoList.stream().map(AlbumPo::getId).collect(Collectors.toList());
        if(CollectionUtils.isNotEmpty(albumList)){
            AlbumPhotoCondition albumPhotoCondition = new AlbumPhotoCondition();
            albumPhotoCondition.setAlbumIdList(albumList);
            List<AlbumPhotoPo> albumPhotoPoList = albumPhotoService.queryList(albumPhotoCondition);
            //相册id分组
            Map<String, List<AlbumPhotoPo>> albumMap = albumPhotoPoList.stream().collect(Collectors.groupingBy(m -> String.valueOf(m.getAlbumId())));
            this.getModel().addAttribute("albumMap", albumMap);
        }
        this.getModel().addAttribute("albumList", albumPoList);
        return "album_list";
    }

    @RequestMapping("/photo/list")
    @AdminLogin
    public String photoList(AlbumPhotoCondition albumPhotoCondition) throws SchoolException{
        List<AlbumPhotoPo> albumPhotoPoList = albumPhotoService.queryList(albumPhotoCondition);
        if(CollectionUtils.isNotEmpty(albumPhotoPoList)){
            List<Integer> albumIdList = albumPhotoPoList.stream().map(AlbumPhotoPo::getAlbumId).collect(Collectors.toList());
            AlbumCondition albumCondition = new AlbumCondition();
            albumCondition.setIdList(albumIdList);
            List<AlbumPo> albumPoList = this.getService().queryList(albumCondition);
            Map<String, AlbumPo> albumPoMap = albumPoList.stream().collect(Collectors.toMap(m -> String.valueOf(m.getId()), Function.identity()));
            this.getModel().addAttribute("albumMap",albumPoMap);
        }
        this.getModel().addAttribute("photoList", albumPhotoPoList);
        return "photo_list";
    }

    @RequestMapping("/album/show")
    @AdminLogin
    public String albumShow() throws SchoolException{
        AlbumPhotoCondition albumPhotoCondition = new AlbumPhotoCondition();
        albumPhotoCondition.setAlbumId(this.getCondition().getId());
        List<AlbumPhotoPo> albumPhotoPoList = albumPhotoService.queryList(albumPhotoCondition);
        this.getModel().addAttribute("photoList", albumPhotoPoList);
        return "photo_show";
    }

    @RequestMapping("/album/add")
    @AdminLogin
    @ResponseBody
    public AjaxResult add() throws AjaxException {
        try {
            AlbumPo po = this.getPo();
            po.setAddTime(new Date());
            this.getService().insert(po);
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/photo/stop")
    @AdminLogin
    @ResponseBody
    public AjaxResult photoStop(AlbumPhotoPo albumPhotoPo) throws AjaxException {
        File file = new File(uploadPath + File.separator + albumPhotoPo.getPhotoId());
        albumPhotoPo.setPhotoId("temp_" + albumPhotoPo.getPhotoId());
        try {
            if(file.renameTo(new File(uploadPath + File.separator + albumPhotoPo.getPhotoId()))){
                albumPhotoService.update(albumPhotoPo);
            }
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/photo/start")
    @AdminLogin
    @ResponseBody
    public AjaxResult photoStart(AlbumPhotoPo albumPhotoPo) throws AjaxException {
        File file = new File(uploadPath + File.separator + albumPhotoPo.getPhotoId());
        albumPhotoPo.setPhotoId(albumPhotoPo.getPhotoId().substring(5));
        try {
            if(file.renameTo(new File(uploadPath + File.separator + albumPhotoPo.getPhotoId()))){
                albumPhotoService.update(albumPhotoPo);
            }
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/album/rename")
    @AdminLogin
    @ResponseBody
    public AjaxResult albumRename() throws AjaxException {
        try {
            this.getService().update(this.getPo());
            return new AjaxResult();
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }

    @RequestMapping("/photo/del")
    @AdminLogin
    @ResponseBody
    public AjaxResult photoDel(AlbumPhotoPo albumPhotoPo) throws AjaxException {
        File file = new File(uploadPath + File.separator + albumPhotoPo.getPhotoId());
        try {
            if(file.delete()){
                albumPhotoService.delete(albumPhotoPo.getId());
                return new AjaxResult();
            }
            return new AjaxResult(false, "删除失败");
        } catch (SchoolException e) {
            throw new AjaxException();
        }
    }
}