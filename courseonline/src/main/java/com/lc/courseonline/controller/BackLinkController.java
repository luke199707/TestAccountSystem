package com.lc.courseonline.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@Api(description = "后台跳转管理")
@RestController
@RequestMapping("/backlink")
public class BackLinkController {

    @ApiOperation(value = "登录页面")
    @GetMapping("login")
    public ModelAndView login(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/login");
        return mav;
    }

    @ApiOperation(value = "密码重置页面")
    @GetMapping("forgetPwd")
    public ModelAndView forgetPwd(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/forgetPwd");
        return mav;
    }

    @ApiOperation(value = "主页")
    @GetMapping("index")
    public ModelAndView index(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/index");
        return mav;
    }

    @ApiOperation(value = "公告管理页")
    @GetMapping("notice")
    public ModelAndView notice(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/notice");
        return mav;
    }

    @ApiOperation(value = "学生管理页")
    @GetMapping("student")
    public ModelAndView student(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/student");
        return mav;
    }

    @ApiOperation(value = "学院管理页")
    @GetMapping("department")
    public ModelAndView department(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/department");
        return mav;
    }
    @ApiOperation(value = "年级管理页")
    @GetMapping("grade")
    public ModelAndView grade(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/grade");
        return mav;
    }
    @ApiOperation(value = "班级管理页")
    @GetMapping("sclass")
    public ModelAndView sclass(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/sclass");
        return mav;
    }

    @ApiOperation(value = "视频观看情况查询页")
    @GetMapping("viewRecords")
    public ModelAndView viewRecords(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/viewRecords");
        return mav;
    }

    @ApiOperation(value = "课程基本信息管理页")
    @GetMapping("courseInfo")
    public ModelAndView courseInfo(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/courseInfo");
        return mav;
    }

    @ApiOperation(value = "章节管理页")
    @GetMapping("chapter")
    public ModelAndView chapter(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/chapter");
        return mav;
    }

    @ApiOperation(value = "小节管理页")
    @GetMapping("subsection")
    public ModelAndView subsection(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/subsection");
        return mav;
    }

    @ApiOperation(value = "教学大纲管理页")
    @GetMapping("courseOutline")
    public ModelAndView courseOutline(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/courseOutline");
        return mav;
    }

    @ApiOperation(value = "教学日历管理页")
    @GetMapping("courseCalendar")
    public ModelAndView courseCalendar(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/courseCalendar");
        return mav;
    }

    @ApiOperation(value = "三级项目管理页")
    @GetMapping("courseLevelIIIProject")
    public ModelAndView courseLevelIIIProject(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/courseLevelIIIProject");
        return mav;
    }

    @ApiOperation(value = "课程设计安排管理页")
    @GetMapping("courseDesignPlan")
    public ModelAndView courseDesignPlan(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/courseDesignPlan");
        return mav;
    }

    @ApiOperation(value = "课程教师介绍管理页")
    @GetMapping("courseTeacher")
    public ModelAndView courseTeacher(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/courseTeacher");
        return mav;
    }

    @ApiOperation(value = "课件管理页")
    @GetMapping("material")
    public ModelAndView material(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/material");
        return mav;
    }

    @ApiOperation(value = "优秀作品管理页")
    @GetMapping("excellentworks")
    public ModelAndView excellentworks(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/excellentworks");
        return mav;
    }

    @ApiOperation(value = "问题反馈管理页")
    @GetMapping("questionReply")
    public ModelAndView questionReply(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/questionReply");
        return mav;
    }

    @ApiOperation(value = "个人主页")
    @GetMapping("adminInfo")
    public ModelAndView adminInfo(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/adminInfo");
        return mav;
    }

    @ApiOperation(value = "修改密码页")
    @GetMapping("updatePwd")
    public ModelAndView updatePwd(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("back/updatePwd");
        return mav;
    }

}
