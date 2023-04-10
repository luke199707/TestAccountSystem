package com.lc.courseonline.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.commons.utils.FileUtil;
import com.lc.courseonline.entity.ExcellentWorkAttachment;
import com.lc.courseonline.service.ExcellentWorkAttachmentService;
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
 * @since 2022-08-11
 */
@RestController
@RequestMapping("/courseonline/excellentWorkAttachment")
public class ExcellentWorkAttachmentController {
    @Autowired
    private ExcellentWorkAttachmentService excellentWorkAttachmentService;

    @Autowired
    private FileUtil fileUtil;

    @ApiOperation(value = "附件添加")
    @PostMapping("add")
    public void add(ExcellentWorkAttachment n) {
        //封装数据
        ExcellentWorkAttachment noticeAttachment = new ExcellentWorkAttachment();
        if (n != null) {
            noticeAttachment.setId(n.getId());
            noticeAttachment.setName(n.getName());
            noticeAttachment.setExcellentworkid(n.getExcellentworkid());
            noticeAttachment.setUrl(n.getUrl());
            noticeAttachment.setRealpath(n.getRealpath());
        }
        //执行dao
        excellentWorkAttachmentService.save(noticeAttachment);
    }

    @ApiOperation(value = "附件删除")
    @GetMapping("deleteById")
    @ResponseBody
    public String deleteById(String id) {
        if (!id.isEmpty() && id != null) {
            ExcellentWorkAttachment excellentWorkAttachment = excellentWorkAttachmentService.getById(id);
            //删除附件文件
            fileUtil.delete(excellentWorkAttachment.getRealpath());
            //删除数据库信息
            if (excellentWorkAttachmentService.removeById(id)) {
                return "success";
            }
        }
        return "fail";
    }

    //---------------------------------------------------前台使用---------------------------------------------------

    @ApiOperation(value = "通过作品id获取附件")
    @GetMapping("getAttachmentByExcellentWorkId")
    @ResponseBody
    public List<ExcellentWorkAttachment> getAttachmentByExcellentWorkId(String excellentworkid){
        QueryWrapper<ExcellentWorkAttachment> wrapper = new QueryWrapper<>();
        wrapper.orderByAsc("create_time");
        wrapper.eq("excellentworkid",excellentworkid);
        List<ExcellentWorkAttachment> data = excellentWorkAttachmentService.list(wrapper);
        return data;
    }
}

