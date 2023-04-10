package com.lc.courseonline.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lc.courseonline.commons.utils.FileUtil;
import com.lc.courseonline.commons.utils.LayuiTableData;
import com.lc.courseonline.commons.utils.UUIDUtil;
import com.lc.courseonline.commons.utils.WangEditorFileData;
import com.lc.courseonline.entity.CourseInfo;
import com.lc.courseonline.service.*;
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
 * @since 2022-07-15
 */
@Api(description = "课程管理")
@RestController
@RequestMapping("/courseonline/course")
public class CourseInfoController {

    @Autowired
    private FileUtil fileUtil;

    @Autowired
    private CourseInfoService courseInfoService;

    @Autowired
    private ChapterService chapterService;

    @Autowired
    private SubsectionService subsectionService;

    @Autowired
    private CourseOutlineService courseOutlineService;

    @Autowired
    private CourseCalendarService courseCalendarService;

    @Autowired
    private CourseLevelIIIProjectService courseLevelIIIProjectService;

    @Autowired
    private CourseDesignPlanService courseDesignPlanService;

    @Autowired
    private CourseTeacherService courseTeacherService;

    @ApiOperation(value = "课程添加")
    @PostMapping("add")
    public ModelAndView add(String title, String introduction){
        ModelAndView mav = new ModelAndView();
        //封装数据
        CourseInfo courseInfo = new CourseInfo();
        courseInfo.setId(UUIDUtil.getUUID());
        courseInfo.setTitle(title);
        courseInfo.setIntroduction(introduction);
        //执行Dao
        courseInfoService.save(courseInfo);
        //返回
        mav.setViewName("redirect:/backlink/courseInfo");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "图片上传")
    @PostMapping("courseInfoPictureUpload")
    public WangEditorFileData courseInfoPictureUpload(MultipartFile file){
        WangEditorFileData wangEditorFileData = new WangEditorFileData();
        //文件上传
        if (!file.isEmpty()){
            Map<String, Object> fileInfoMap = fileUtil.upload(file,"courseInfoPicture");//dir为文件存放目录
            if (fileInfoMap.get("url")!=null){
                wangEditorFileData.setErrno(0);
                wangEditorFileData.setMessage("图片上传成功");
                HashMap<String, Object> map = new HashMap<>();
                map.put("url", fileInfoMap.get("url"));
                map.put("alt", "courseInfoImage");
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
    @PostMapping("courseInfoVideoUpload")
    public WangEditorFileData courseInfoVideoUpload(MultipartFile file){
        WangEditorFileData wangEditorFileData = new WangEditorFileData();
        //文件上传
        if (!file.isEmpty()){
            Map<String, Object> fileInfoMap = fileUtil.upload(file,"courseInfoVideo");//dir为文件存放目录
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

    @ApiOperation(value = "课程删除")
    @GetMapping("deleteById")
    @ResponseBody
    public String deleteById(String id){
        //删除小节信息
        subsectionService.deleteSubsectionByCourseid(id);
        //删除章节信息
        chapterService.deleteChapterByCourseid(id);
        //删除大纲
        courseOutlineService.deleteByCourseId(id);
        //删除教学日历
        courseCalendarService.deleteByCourseId(id);
        //删除三级项目
        courseLevelIIIProjectService.deleteByCourseId(id);
        //删除课设安排
        courseDesignPlanService.deleteByCourseId(id);
        //删除课程教师介绍
        courseTeacherService.deleteByCourseId(id);
        //最后删除课程信息
        if (courseInfoService.removeById(id)) {
            return "success";
        }
        return "fail";
    }

    @ApiOperation(value = "课程修改")
    @PostMapping("edit")
    public ModelAndView edit(String id, String title, String introduction){
        ModelAndView mav = new ModelAndView();
        //封装数据
        CourseInfo courseInfo = courseInfoService.getById(id);
        courseInfo.setTitle(title);
        courseInfo.setIntroduction(introduction);
        //执行Dao
        courseInfoService.updateById(courseInfo);
        //返回
        mav.setViewName("redirect:/backlink/courseInfo");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "课程分页条件查询")
    @GetMapping("pageListCourse")
    public LayuiTableData pageListCourse(long page, long limit, String title, String sortField, String order){
        //创建layui数据表格专用返回对象
        LayuiTableData layuiTableData = new LayuiTableData();
        //封装公告list查询条件
        QueryWrapper<CourseInfo> listWrapper = new QueryWrapper<>();
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
        Page<CourseInfo> pageCourse = new Page<>(page,limit);
        courseInfoService.page(pageCourse, listWrapper);
        long total = pageCourse.getTotal();
        List<CourseInfo> data = pageCourse.getRecords();
        //返回数据封装
        layuiTableData.setCode(0);
        layuiTableData.setMsg("");
        layuiTableData.setCount(total);
        layuiTableData.setData(data);
        //返回
        return layuiTableData;
    }

    @ApiOperation(value = "获取所有课程")
    @GetMapping("getAll")
    @ResponseBody
    public List<CourseInfo> getAll() {
        QueryWrapper<CourseInfo> wrapper = new QueryWrapper<>();
        wrapper.orderByAsc("title");
        List<CourseInfo> courseInfoList = courseInfoService.list(wrapper);
        return courseInfoList;
    }

    @ApiOperation(value = "通过名称获取id")
    @GetMapping("getIdByTitle")
    @ResponseBody
    public String getIdByTitle(String title) {
        QueryWrapper<CourseInfo> wrapper = new QueryWrapper<>();
        wrapper.eq("title",title);
        CourseInfo one = courseInfoService.getOne(wrapper);
        return one.getId();
    }

    @ApiOperation(value = "添加时校验是否只有一个课程")
    @GetMapping("checkCount")
    @ResponseBody
    public String  checkCount() {
        List<CourseInfo> list = getAll();
        if (list.size()>0){
            return "CourseFull";
        }
        return "CourseEmpty";
    }

    @ApiOperation(value = "添加时确认参数")
    @GetMapping("addCheckParams")
    @ResponseBody
    public boolean  addCheckParams(String param, String value) {
        boolean result = courseInfoService.addCheckParams(param,value);
        return result;
    }

    @ApiOperation(value = "编辑时确认参数")
    @GetMapping("editCheckParams")
    @ResponseBody
    public boolean  editCheckParams(String param, String value,String id) {
        boolean result = courseInfoService.editCheckParams(param,value,id);
        return result;
    }


    //---------------------------------------------------前台使用---------------------------------------------------

    @ApiOperation(value = "获取课程")
    @GetMapping("getCourse")
    @ResponseBody
    public CourseInfo getCourse(){
        CourseInfo courseInfo = courseInfoService.getOne(null);
        return courseInfo;
    }
}

