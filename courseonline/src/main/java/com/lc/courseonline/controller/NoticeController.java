package com.lc.courseonline.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lc.courseonline.commons.utils.*;
import com.lc.courseonline.entity.FrontDataPage;
import com.lc.courseonline.entity.Notice;
import com.lc.courseonline.entity.NoticeAttachment;
import com.lc.courseonline.service.NoticeAttachmentService;
import com.lc.courseonline.service.NoticeService;
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
 *  前端控制器
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-10
 */
@Api(description = "公告管理")
@RestController
@RequestMapping("/courseonline/notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private NoticeAttachmentService noticeAttachmentService;

    @Autowired
    private NoticeAttachmentController noticeAttachmentController;

    @Autowired
    private FileUtil fileUtil;

    @ApiOperation(value = "公告添加")
    @PostMapping("add")
    public ModelAndView add(String noticeId,String title,String mainContent){
        ModelAndView mav = new ModelAndView();
        //封装数据
        Notice notice = new Notice();
        notice.setId(noticeId);
        notice.setTitle(title);
        notice.setMainContent(mainContent);
        //执行Dao
        noticeService.save(notice);
        //返回
        mav.setViewName("redirect:/backlink/notice");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "公告删除")
    @GetMapping("deleteById")
    @ResponseBody
    public String deleteById(String id){
        //删除附件(同时删除附件文件)
        List<NoticeAttachment> noticeAttachmentList = noticeAttachmentController.getAttachmentByNoticeId(id);
        for (NoticeAttachment data:noticeAttachmentList) {
            noticeAttachmentController.deleteById(data.getId());
        }
        //再删除数据库信息
        if (noticeService.removeById(id)){
            return "success";
        }
        return "fail";
    }

    @ApiOperation(value = "公告修改")
    @PostMapping("edit")
    public ModelAndView edit(String id, String title,String mainContent){
        ModelAndView mav = new ModelAndView();
        //封装数据
        Notice notice = noticeService.getById(id);
        notice.setTitle(title);
        notice.setMainContent(mainContent);
        //执行Dao
        noticeService.updateById(notice);
        //返回
        mav.setViewName("redirect:/backlink/notice");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "公告分页条件查询")
    @GetMapping("pageListNotice")
    public LayuiTableData pageListNotice(long page, long limit,String title,String sortField,String order){
        //创建layui数据表格专用返回对象
        LayuiTableData layuiTableData = new LayuiTableData();
        //封装公告list查询条件
        QueryWrapper<Notice> listWrapper = new QueryWrapper<>();
        if (sortField!=null&&!("".equals(sortField))){
            if ("asc".equals(order)){
                listWrapper.orderBy(true,true,sortField);
            }else {
                listWrapper.orderBy(true,false,sortField);
            }
        }else {
            listWrapper.orderByDesc("create_time");
        }
        if (title!=null&&!("".equals(title))){
            listWrapper.like("title",title);
        }
        //分页page对象
        Page<Notice> pageNotice = new Page<>(page,limit);
        noticeService.page(pageNotice, listWrapper);
        long total = pageNotice.getTotal();
        List<Notice> data = pageNotice.getRecords();
        //返回数据封装
        layuiTableData.setCode(0);
        layuiTableData.setMsg("");
        layuiTableData.setCount(total);
        layuiTableData.setData(data);
        //返回
        return layuiTableData;
    }

    @ApiOperation(value = "公告图片上传")
    @PostMapping("noticePictureUpload")
    public WangEditorFileData noticePictureUpload(MultipartFile file){
        WangEditorFileData wangEditorFileData = new WangEditorFileData();
        //文件上传
        if (!file.isEmpty()){
            Map<String, Object> fileInfoMap = fileUtil.upload(file,"noticePicture");//dir为文件存放目录
            if (fileInfoMap.get("url")!=null){
                wangEditorFileData.setErrno(0);
                wangEditorFileData.setMessage("图片上传成功");
                HashMap<String, Object> map = new HashMap<>();
                map.put("url", fileInfoMap.get("url"));
                map.put("alt", "image");
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

    @ApiOperation(value = "公告视频上传")
    @PostMapping("noticeVideoUpload")
    public WangEditorFileData noticeVideoUpload(MultipartFile file){
        WangEditorFileData wangEditorFileData = new WangEditorFileData();
        //文件上传
        if (!file.isEmpty()){
            Map<String, Object> fileInfoMap = fileUtil.upload(file,"noticeVideo");//dir为文件存放目录
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

    @ApiOperation(value = "公告附件上传")
    @PostMapping("noticeAttachmentUpload")
    public LayuiFileData noticeAttachmentUpload(MultipartFile file,String noticeId){
        LayuiFileData layuiFileData = new LayuiFileData();
        //文件上传
        if (!file.isEmpty()){
            Map<String, Object> fileInfoMap = fileUtil.upload(file,"noticeAttachment");//dir为文件存放目录
            if (fileInfoMap.get("url")!=null){
                layuiFileData.setCode(0);
                layuiFileData.setMsg("文件上传成功");
                HashMap<String, String> map = new HashMap<>();
                map.put("url", (String) fileInfoMap.get("url"));
                map.put("realpath", (String) fileInfoMap.get("realpath"));
                layuiFileData.setData(map);

                //将文件信息存入noticAttachment表
                String originalFilename = file.getOriginalFilename();//获取上传文件名称
                String name = originalFilename.substring(0,originalFilename.lastIndexOf("."));
                NoticeAttachment noticeAttachment = new NoticeAttachment();
                noticeAttachment.setId(UUIDUtil.getUUID());
                noticeAttachment.setNoticeid(noticeId);
                noticeAttachment.setName(name);
                noticeAttachment.setUrl((String) fileInfoMap.get("url"));
                noticeAttachment.setRealpath((String) fileInfoMap.get("realpath"));
                noticeAttachmentService.save(noticeAttachment);
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

    //---------------------------------------------------前台使用---------------------------------------------------

    @ApiOperation(value = "获取前N条公告")
    @GetMapping("getNoticeTop")
    @ResponseBody
    public List<Notice> getNoticeTop(Integer N){
        QueryWrapper<Notice> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("create_time");
        //分页page对象
        Page<Notice> pageNotice = new Page<>(1,N);
        noticeService.page(pageNotice, wrapper);
        List<Notice> data = pageNotice.getRecords();
        return data;
    }

    @ApiOperation(value = "前台分页条件查询公告")
    @GetMapping("getFrontPageNotice")
    @ResponseBody
    public Map<String,Object> getFrontPageNotice(FrontDataPage frontDataPage){

        QueryWrapper<Notice> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("create_time");
        // 分页page对象
        Page<Notice> pageNotice = new Page<>(frontDataPage.getCurrent(),frontDataPage.getLimit());
        noticeService.page(pageNotice, wrapper);
        long total = pageNotice.getTotal();
        List<Notice> noticeList = pageNotice.getRecords();
        // 前台分页对象
        frontDataPage.setRows(total);
        frontDataPage.setPath("/frontlink/notice");

        HashMap<String, Object> map = new HashMap<>();
        map.put("frontDataPage",frontDataPage);
        map.put("noticeList",noticeList);
        return map;
    }

    @ApiOperation(value = "前台查询公告")
    @GetMapping("getNoticeById")
    @ResponseBody
    public Notice getNoticeById(String id){
        Notice notice = noticeService.getById(id);
        return notice;
    }
}

