package com.lc.courseonline.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lc.courseonline.commons.utils.*;
import com.lc.courseonline.entity.ExcellentWorkAttachment;
import com.lc.courseonline.entity.ExcellentWorks;
import com.lc.courseonline.entity.FrontDataPage;
import com.lc.courseonline.service.ExcellentWorkAttachmentService;
import com.lc.courseonline.service.ExcellentWorksService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-19
 */
@Api(description = "优秀作品管理")
@RestController
@RequestMapping("/courseonline/excellentworks")
public class ExcellentWorksController {

    @Autowired
    private ExcellentWorksService excellentWorksService;

    @Autowired
    private ExcellentWorkAttachmentController excellentWorkAttachmentController;

    @Autowired
    private ExcellentWorkAttachmentService excellentWorkAttachmentService;

    @Autowired
    private FileUtil fileUtil;

    @ApiOperation(value = "作品添加")
    @PostMapping("add")
    public ModelAndView add(String excellentWorksId,String name, String introduction, String author, String url) {
        ModelAndView mav = new ModelAndView();
        //封装数据
        ExcellentWorks works = new ExcellentWorks();
        works.setId(excellentWorksId);
        works.setName(name);
        works.setIntroduction(introduction);
        works.setAuthor(author);
        works.setUrl(url);
        //执行Dao
        excellentWorksService.save(works);
        //返回
        mav.setViewName("redirect:/backlink/excellentworks");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "作品删除")
    @GetMapping("deleteById")
    @ResponseBody
    public String deleteById(String id) {
        //删除附件(同时删除附件文件)
        List<ExcellentWorkAttachment> excellentWorkAttachmentList = excellentWorkAttachmentController.getAttachmentByExcellentWorkId(id);
        for (ExcellentWorkAttachment data:excellentWorkAttachmentList) {
            excellentWorkAttachmentController.deleteById(data.getId());
        }
        //再删除数据库信息
        if (excellentWorksService.removeById(id)) {
            return "success";
        }
        return "fail";
    }

    @ApiOperation(value = "作品修改")
    @PostMapping("edit")
    public ModelAndView edit(String id, String name, String introduction, String author, String url) {
        ModelAndView mav = new ModelAndView();
        //封装数据
        ExcellentWorks works = excellentWorksService.getById(id);
        works.setName(name);
        works.setIntroduction(introduction);
        works.setAuthor(author);
        works.setUrl(url);
        //执行Dao
        excellentWorksService.updateById(works);
        //返回
        mav.setViewName("redirect:/backlink/excellentworks");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "图片上传")
    @PostMapping("excellentWorksPictureUpload")
    public WangEditorFileData excellentWorksUpload(MultipartFile file){
        WangEditorFileData wangEditorFileData = new WangEditorFileData();
        //文件上传
        if (!file.isEmpty()){
            Map<String, Object> fileInfoMap = fileUtil.upload(file,"excellentWorksPicture");//dir为文件存放目录
            if (fileInfoMap.get("url")!=null){
                wangEditorFileData.setErrno(0);
                wangEditorFileData.setMessage("图片上传成功");
                HashMap<String, Object> map = new HashMap<>();
                map.put("url", fileInfoMap.get("url"));
                map.put("alt", "excellentWorksImage");
                wangEditorFileData.setData(map);
            }else {
                wangEditorFileData.setErrno(1);
                wangEditorFileData.setMessage("图片上传失败");
            }
        }else {
            wangEditorFileData.setErrno(1);
            wangEditorFileData.setMessage("图片上传失败");
        }
        //返回
        return wangEditorFileData;
    }

    @ApiOperation(value = "视频上传")
    @PostMapping("excellentWorksVideoUpload")
    public WangEditorFileData excellentWorksVideoUpload(MultipartFile file){
        WangEditorFileData wangEditorFileData = new WangEditorFileData();
        //文件上传
        if (!file.isEmpty()){
            Map<String, Object> fileInfoMap = fileUtil.upload(file,"excellentWorksVideo");//dir为文件存放目录
            if (fileInfoMap.get("url")!=null){
                wangEditorFileData.setErrno(0);
                wangEditorFileData.setMessage("视频上传成功");
                HashMap<String, Object> map = new HashMap<>();
                map.put("url", fileInfoMap.get("url"));
                wangEditorFileData.setData(map);
            }else {
                wangEditorFileData.setErrno(1);
                wangEditorFileData.setMessage("视频上传失败");
            }
        }else {
            wangEditorFileData.setErrno(1);
            wangEditorFileData.setMessage("视频上传失败");
        }
        //返回
        return wangEditorFileData;
    }

    @ApiOperation(value = "附件上传")
    @PostMapping("excellentWorksAttachmentUpload")
    public LayuiFileData excellentWorksAttachmentUpload(MultipartFile file, String excellentWorksId){
        LayuiFileData layuiFileData = new LayuiFileData();
        //文件上传
        if (!file.isEmpty()){
            Map<String, Object> fileInfoMap = fileUtil.upload(file,"excellentWorksAttachment");//dir为文件存放目录
            if (fileInfoMap.get("url")!=null){
                layuiFileData.setCode(0);
                layuiFileData.setMsg("文件上传成功");
                HashMap<String, String> map = new HashMap<>();
                map.put("url", (String) fileInfoMap.get("url"));
                map.put("realpath", (String) fileInfoMap.get("realpath"));
                layuiFileData.setData(map);

                //将文件信息存入数据库表
                String originalFilename = file.getOriginalFilename();//获取上传文件名称
                String name = originalFilename.substring(0,originalFilename.lastIndexOf("."));
                ExcellentWorkAttachment excellentWorkAttachment = new ExcellentWorkAttachment();
                excellentWorkAttachment.setId(UUIDUtil.getUUID());
                excellentWorkAttachment.setExcellentworkid(excellentWorksId);
                excellentWorkAttachment.setName(name);
                excellentWorkAttachment.setUrl((String) fileInfoMap.get("url"));
                excellentWorkAttachment.setRealpath((String) fileInfoMap.get("realpath"));
                excellentWorkAttachmentService.save(excellentWorkAttachment);
            }else {
                layuiFileData.setCode(1);
                layuiFileData.setMsg("文件上传失败");
            }
        }else {
            layuiFileData.setCode(1);
            layuiFileData.setMsg("文件上传失败");
        }
        //返回
        return layuiFileData;
    }

    @ApiOperation(value = "作品分页条件查询")
    @GetMapping("pageListWorks")
    @ResponseBody
    public LayuiTableData pageListWorks(long page, long limit, String name, String sortField, String order) {
        //创建layui数据表格专用返回对象
        LayuiTableData layuiTableData = new LayuiTableData();
        //封装公告list查询条件
        QueryWrapper<ExcellentWorks> listWrapper = new QueryWrapper<>();
        if (sortField != null && !("".equals(sortField))) {
            if ("asc".equals(order)) {
                listWrapper.orderBy(true, true, sortField);
            } else {
                listWrapper.orderBy(true, false, sortField);
            }
        } else {
            listWrapper.orderByDesc("create_time");
        }
        if (name != null && !("".equals(name))) {
            listWrapper.like("name", name);
        }
        //分页page对象
        Page<ExcellentWorks> pageNotice = new Page<>(page, limit);
        excellentWorksService.page(pageNotice, listWrapper);
        long total = pageNotice.getTotal();
        List<ExcellentWorks> data = pageNotice.getRecords();
        //返回数据封装
        layuiTableData.setCode(0);
        layuiTableData.setMsg("");
        layuiTableData.setCount(total);
        layuiTableData.setData(data);
        //返回
        return layuiTableData;
    }

    @ApiOperation(value = "获取前3条优秀作品")
    @GetMapping("getWorksTop")
    @ResponseBody
    public List<ExcellentWorks> getWorksTop(Integer N){
        QueryWrapper<ExcellentWorks> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("create_time");
        //分页page对象
        Page<ExcellentWorks> pageNotice = new Page<>(1,N);
        excellentWorksService.page(pageNotice, wrapper);
        List<ExcellentWorks> data = pageNotice.getRecords();
        return data;
    }

    @ApiOperation(value = "添加时确认参数")
    @GetMapping("addCheckParams")
    @ResponseBody
    public boolean addCheckParams(String param, String value) {
        boolean result = excellentWorksService.addCheckParams(param, value);
        return result;
    }

    @ApiOperation(value = "编辑时确认参数")
    @GetMapping("editCheckParams")
    @ResponseBody
    public boolean editCheckParams(String param, String value, String id) {
        boolean result = excellentWorksService.editCheckParams(param, value, id);
        return result;
    }

    //---------------------------------------------------前台使用---------------------------------------------------

    @ApiOperation(value = "前台分页条件查询课件资料")
    @GetMapping("getFrontPageExcellentWorks")
    @ResponseBody
    public Map<String,Object> getFrontPageExcellentWorks(FrontDataPage frontDataPage){
        QueryWrapper<ExcellentWorks> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("create_time");
        // 分页page对象
        Page<ExcellentWorks> pageNotice = new Page<>(frontDataPage.getCurrent(),frontDataPage.getLimit());
        excellentWorksService.page(pageNotice, wrapper);
        long total = pageNotice.getTotal();
        List<ExcellentWorks> excellentWorksList = pageNotice.getRecords();
        // 前台分页对象
        frontDataPage.setRows(total);
        frontDataPage.setPath("/frontlink/excellentWorks");

        HashMap<String, Object> map = new HashMap<>();
        map.put("frontDataPage",frontDataPage);
        map.put("excellentWorksList",excellentWorksList);
        return map;
    }

    @ApiOperation(value = "前台查询")
    @GetMapping("getById")
    @ResponseBody
    public ExcellentWorks getById(String id){
        ExcellentWorks data = excellentWorksService.getById(id);
        return data;
    }
}

