package com.lc.courseonline.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lc.courseonline.commons.utils.LayuiTableData;
import com.lc.courseonline.commons.utils.UUIDUtil;
import com.lc.courseonline.entity.FrontDataPage;
import com.lc.courseonline.entity.Subsection;
import com.lc.courseonline.service.SubsectionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
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
 * @since 2022-07-15
 */
@Api(description = "小节管理")
@RestController
@RequestMapping("/courseonline/subsection")
public class SubsectionController {
    @Autowired
    private SubsectionService subsectionService;

    @ApiOperation(value = "小节添加")
    @PostMapping("add")
    public ModelAndView add(Subsection sub){
        ModelAndView mav = new ModelAndView();
        //封装数据
        Subsection subsection = new Subsection();
        subsection.setId(UUIDUtil.getUUID());
        subsection.setCourseid(sub.getCourseid());
        subsection.setChapterid(sub.getChapterid());
        subsection.setTitle(sub.getTitle());
        subsection.setIntroduction(sub.getIntroduction());
        subsection.setVideoname(sub.getVideoname());
        subsection.setVideourl(sub.getVideourl());
        subsection.setVideorealpath(sub.getVideorealpath());
        //执行Dao
        subsectionService.save(subsection);
        //返回
        mav.setViewName("redirect:/backlink/subsection");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "小节删除")
    @GetMapping("deleteById")
    @ResponseBody
    public String deleteById(String id){
        if (subsectionService.removeById(id)) {
            return "success";
        }
        return "fail";
    }

    @ApiOperation(value = "小节修改")
    @PostMapping("edit")
    public ModelAndView edit(Subsection sub){
        ModelAndView mav = new ModelAndView();
        //封装数据
        Subsection subsection = subsectionService.getById(sub.getId());
        subsection.setCourseid(sub.getCourseid());
        subsection.setChapterid(sub.getChapterid());
        subsection.setTitle(sub.getTitle());
        subsection.setIntroduction(sub.getIntroduction());
        subsection.setVideoname(sub.getVideoname());
        subsection.setVideourl(sub.getVideourl());
        subsection.setVideorealpath(sub.getVideorealpath());
        //执行Dao
        subsectionService.updateById(subsection);
        //返回
        mav.setViewName("redirect:/backlink/subsection");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "小节分页条件查询")
    @GetMapping("pageListConditionSubsection")
    public LayuiTableData pageListConditionSubsection(long page, long limit, String title,
                                                   @RequestParam(required = false,defaultValue = "create_time") String sortField,
                                                   @RequestParam(required = false,defaultValue = "asc") String order){
        //创建layui数据表格专用返回对象
        LayuiTableData layuiTableData = new LayuiTableData();
        //封装list查询条件
        Map<String, Object> map = new HashMap<>();
        map.put("title", title);
        map.put("sortField", sortField);
        map.put("order", order);
        //        map.put("page", (page - 1) * limit);//使用offset关键字分页时使用
        map.put("page", page);
        map.put("limit", limit);
        List<Subsection> data = subsectionService.querySubsectionByConditionForPage(map);
        int total = subsectionService.queryCountOfSubsectionByCondition(map);
        //返回数据封装
        layuiTableData.setCode(0);
        layuiTableData.setMsg("");
        layuiTableData.setCount(total);
        layuiTableData.setData(data);
        //返回
        return layuiTableData;
    }

    @ApiOperation(value = "通过章节id获取")
    @GetMapping("getByChapterid")
    @ResponseBody
    public List<Subsection> getByChapterid(String chapterid) {
        QueryWrapper<Subsection> wrapper = new QueryWrapper<>();
        wrapper.orderByAsc("create_time");
        wrapper.eq("chapterid",chapterid);
        List<Subsection> subsectionList = subsectionService.list(wrapper);
        return subsectionList;
    }

    @ApiOperation(value = "添加时确认参数")
    @GetMapping("addCheckParams")
    @ResponseBody
    public boolean  addCheckParams(String param, String value) {
        boolean result = subsectionService.addCheckParams(param,value);
        return result;
    }

    @ApiOperation(value = "编辑时确认参数")
    @GetMapping("editCheckParams")
    @ResponseBody
    public boolean  editCheckParams(String param, String value,String id) {
        boolean result = subsectionService.editCheckParams(param,value,id);
        return result;
    }

    //---------------------------------------------------前台使用---------------------------------------------------

    @ApiOperation(value = "前台分页条件查询")
    @GetMapping("getFrontPageSubsection")
    @ResponseBody
    public Map<String,Object> getFrontPageSubsection(FrontDataPage frontDataPage){
        QueryWrapper<Subsection> wrapper = new QueryWrapper<>();
        wrapper.orderByAsc("create_time");
        // 分页page对象
        Page<Subsection> pageSubsection = new Page<>(frontDataPage.getCurrent(),frontDataPage.getLimit());
        subsectionService.page(pageSubsection, wrapper);
        long total = pageSubsection.getTotal();
        List<Subsection> subsectionList = pageSubsection.getRecords();
        // 前台分页对象
        frontDataPage.setRows(total);
        frontDataPage.setPath("/frontlink/subsection");

        HashMap<String, Object> map = new HashMap<>();
        map.put("frontDataPage",frontDataPage);
        map.put("subsectionList",subsectionList);
        return map;
    }

    @ApiOperation(value = "前台分页条件查询公告")
    @GetMapping("getSubsectionById")
    @ResponseBody
    public Subsection getSubsectionById(String id){
        Subsection subsection = subsectionService.getById(id);
        return subsection;
    }

    @ApiOperation(value = "获取相关视频（创建时间大于当前）")
    @GetMapping("getRelatedSubsection")
    @ResponseBody
    public List<Subsection> getRelatedSubsection(String id){
        Subsection subsection = subsectionService.getById(id);
        QueryWrapper<Subsection> wrapper = new QueryWrapper<>();
        wrapper.gt("create_time",subsection.getCreateTime());
        wrapper.orderByAsc("create_time");
        //分页page对象
        Page<Subsection> pageNotice = new Page<>(1,6);
        subsectionService.page(pageNotice, wrapper);
        List<Subsection> data = pageNotice.getRecords();
        return data;
    }
}

