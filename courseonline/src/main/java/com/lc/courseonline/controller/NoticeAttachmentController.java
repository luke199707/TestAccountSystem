package com.lc.courseonline.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lc.courseonline.commons.utils.FileUtil;
import com.lc.courseonline.entity.NoticeAttachment;
import com.lc.courseonline.service.NoticeAttachmentService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-08-10
 */
@Api(description = "公告附件管理")
@RestController
@RequestMapping("/courseonline/noticeAttachment")
public class NoticeAttachmentController {

    @Autowired
    private NoticeAttachmentService noticeAttachmentService;

    @Autowired
    private FileUtil fileUtil;

    @ApiOperation(value = "附件添加")
    @PostMapping("add")
    public void add(NoticeAttachment n) {
        //封装数据
        NoticeAttachment noticeAttachment = new NoticeAttachment();
        if (n != null) {
            noticeAttachment.setId(n.getId());
            noticeAttachment.setName(n.getName());
            noticeAttachment.setNoticeid(n.getNoticeid());
            noticeAttachment.setUrl(n.getUrl());
            noticeAttachment.setRealpath(n.getRealpath());
        }
        //执行dao
        noticeAttachmentService.save(noticeAttachment);
    }

    @ApiOperation(value = "附件删除")
    @GetMapping("deleteById")
    @ResponseBody
    public String deleteById(String id) {
        if (!id.isEmpty() && id != null) {
            NoticeAttachment noticeAttachment = noticeAttachmentService.getById(id);
            //删除附件文件
            fileUtil.delete(noticeAttachment.getRealpath());
            //删除数据库信息
            if (noticeAttachmentService.removeById(id)) {
                return "success";
            }
        }
        return "fail";
    }

    //---------------------------------------------------前台使用---------------------------------------------------

    @ApiOperation(value = "通过公告id获取附件")
    @GetMapping("getAttachmentByNoticeId")
    @ResponseBody
    public List<NoticeAttachment> getAttachmentByNoticeId(String noticeId){
        QueryWrapper<NoticeAttachment> wrapper = new QueryWrapper<>();
        wrapper.orderByAsc("create_time");
        wrapper.eq("noticeid",noticeId);
        List<NoticeAttachment> data = noticeAttachmentService.list(wrapper);
        return data;
    }
}

