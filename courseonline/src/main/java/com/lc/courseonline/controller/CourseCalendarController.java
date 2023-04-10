package com.lc.courseonline.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.commons.utils.FileUtil;
import com.lc.courseonline.commons.utils.LayuiTableData;
import com.lc.courseonline.commons.utils.UUIDUtil;
import com.lc.courseonline.commons.utils.WangEditorFileData;
import com.lc.courseonline.entity.CourseCalendar;
import com.lc.courseonline.service.CourseCalendarService;
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
 * @since 2022-08-10
 */
@Api(description = "教学日历管理")
@RestController
@RequestMapping("/courseonline/courseCalendar")
public class CourseCalendarController {
    @Autowired
    private CourseCalendarService courseCalendarService;
    @Autowired
    private FileUtil fileUtil;

    @ApiOperation(value = "添加")
    @PostMapping("add")
    public ModelAndView add(String courseid, String mainContent){
        ModelAndView mav = new ModelAndView();
        //封装数据
        CourseCalendar courseCalendar = new CourseCalendar();
        courseCalendar.setId(UUIDUtil.getUUID());
        courseCalendar.setCourseid(courseid);
        courseCalendar.setMainContent(mainContent);
        //执行Dao
        courseCalendarService.save(courseCalendar);
        //返回
        mav.setViewName("redirect:/backlink/courseCalendar");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "删除")
    @GetMapping("deleteById")
    @ResponseBody
    public String deleteById(String id){
        if (courseCalendarService.removeById(id)) {
            return "success";
        }
        return "fail";
    }

    @ApiOperation(value = "修改")
    @PostMapping("edit")
    public ModelAndView edit(String id,String courseid, String mainContent){
        ModelAndView mav = new ModelAndView();
        //封装数据
        CourseCalendar courseCalendar = courseCalendarService.getById(id);
        courseCalendar.setCourseid(courseid);
        courseCalendar.setMainContent(mainContent);
        //执行Dao
        courseCalendarService.updateById(courseCalendar);
        //返回
        mav.setViewName("redirect:/backlink/courseCalendar");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "分页条件查询")
    @GetMapping("pageListCondition")
    public LayuiTableData pageListCondition(long page, long limit,
                                            @RequestParam(required = false,defaultValue = "create_time") String sortField,
                                            @RequestParam(required = false,defaultValue = "asc") String order){
        //创建layui数据表格专用返回对象
        LayuiTableData layuiTableData = new LayuiTableData();
        //封装list查询条件
        Map<String, Object> map = new HashMap<>();
        map.put("sortField", sortField);
        map.put("order", order);
        map.put("page", page);
        map.put("limit", limit);
        List<CourseCalendar> data = courseCalendarService.queryCourseCalendarByConditionForPage(map);
        int total = courseCalendarService.queryCountOfCourseCalendarByCondition(map);
        //返回数据封装
        layuiTableData.setCode(0);
        layuiTableData.setMsg("");
        layuiTableData.setCount(total);
        layuiTableData.setData(data);
        //返回
        return layuiTableData;
    }

    @ApiOperation(value = "图片上传")
    @PostMapping("courseCalendarPictureUpload")
    public WangEditorFileData courseCalendarPictureUpload(MultipartFile file){
        WangEditorFileData wangEditorFileData = new WangEditorFileData();
        //文件上传
        if (!file.isEmpty()){
            Map<String, Object> fileInfoMap = fileUtil.upload(file,"courseCalendarPicture");//dir为文件存放目录
            if (fileInfoMap.get("url")!=null){
                wangEditorFileData.setErrno(0);
                wangEditorFileData.setMessage("图片上传成功");
                HashMap<String, Object> map = new HashMap<>();
                map.put("url", fileInfoMap.get("url"));
                map.put("alt", "courseCalendarImage");
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
    @PostMapping("courseCalendarVideoUpload")
    public WangEditorFileData courseCalendarVideoUpload(MultipartFile file){
        WangEditorFileData wangEditorFileData = new WangEditorFileData();
        //文件上传
        if (!file.isEmpty()){
            Map<String, Object> fileInfoMap = fileUtil.upload(file,"courseCalendarVideo");//dir为文件存放目录
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

    @ApiOperation(value = "通过课程id获取")
    @GetMapping("getByCourseid")
    @ResponseBody
    public CourseCalendar getByCourseid(String courseid) {
        QueryWrapper<CourseCalendar> wrapper = new QueryWrapper<>();
        wrapper.orderByAsc("create_time");
        wrapper.eq("courseid",courseid);
        CourseCalendar one = courseCalendarService.getOne(wrapper);
        return one;
    }

    @ApiOperation(value = "添加时确认参数")
    @GetMapping("addCheckParams")
    @ResponseBody
    public boolean  addCheckParams(String param, String value) {
        boolean result = courseCalendarService.addCheckParams(param,value);
        return result;
    }

    @ApiOperation(value = "编辑时确认参数")
    @GetMapping("editCheckParams")
    @ResponseBody
    public boolean  editCheckParams(String param, String value,String id) {
        boolean result = courseCalendarService.editCheckParams(param,value,id);
        return result;
    }
}

