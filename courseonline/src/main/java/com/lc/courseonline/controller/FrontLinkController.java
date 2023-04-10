package com.lc.courseonline.controller;

import com.lc.courseonline.entity.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


@Api(description = "前台跳转管理")
@RestController
@RequestMapping("/frontlink")
public class FrontLinkController {

    @Autowired
    private NoticeController noticeController;

    @Autowired
    private NoticeAttachmentController noticeAttachmentController;

    @Autowired
    private CourseInfoController courseInfoController;

    @Autowired
    private ChapterController chapterController;

    @Autowired
    private SubsectionController subsectionController;

    @Autowired
    private CourseOutlineController courseOutlineController;

    @Autowired
    private CourseCalendarController courseCalendarController;

    @Autowired
    private CourseLevelIIIProjectController courseLevelIIIProjectController;

    @Autowired
    private CourseDesignPlanController courseDesignPlanController;

    @Autowired
    private CourseTeacherController courseTeacherController;

    @Autowired
    private MaterialController materialController;

    @Autowired
    private ExcellentWorksController excellentWorksController;

    @Autowired
    private ExcellentWorkAttachmentController excellentWorkAttachmentController;

    @Autowired
    private QuestionReplyController questionReplyController;

    @ApiOperation(value = "首页")
    @GetMapping("index")
    public ModelAndView index(){
        ModelAndView mav = new ModelAndView();
        /*mav.setViewName("/front/index"); 添加斜杠会导致使用 java -jar 命令启动后项目访问路径出现问题*/
        mav.setViewName("front/index");
        return mav;
    }

    @ApiOperation(value = "公告")
    @GetMapping("notice")
    public ModelAndView notice(FrontDataPage frontDataPage){
        ModelAndView mav = new ModelAndView();
        Map<String, Object> map = noticeController.getFrontPageNotice(frontDataPage);
        mav.addObject("noticeList",map.get("noticeList"));
        mav.addObject("frontDataPage",map.get("frontDataPage"));
        mav.setViewName("front/notice");
        return mav;
    }

    @ApiOperation(value = "公告详情")
    @GetMapping("noticeDetails")
    public ModelAndView noticeDetails(String id){
        ModelAndView mav = new ModelAndView();
        Notice notice = noticeController.getNoticeById(id);
        List<Notice> noticeList = noticeController.getNoticeTop(8);
        List<NoticeAttachment> noticeAttachmentList = noticeAttachmentController.getAttachmentByNoticeId(id);
        //返回
        mav.addObject("notice",notice);
        mav.addObject("noticeList",noticeList);
        mav.addObject("noticeAttachmentList",noticeAttachmentList);
        mav.setViewName("front/noticeDetails");
        return mav;
    }

    @ApiOperation(value = "课程介绍")
    @GetMapping("courseInfo")
    public ModelAndView courseInfo(){
        ModelAndView mav = new ModelAndView();
        CourseInfo course = courseInfoController.getCourse();
        //返回
        mav.addObject("course",course);
        mav.setViewName("front/courseInfo");
        return mav;
    }

    @ApiOperation(value = "教学大纲")
    @GetMapping("courseOutline")
    public ModelAndView courseOutline(){
        ModelAndView mav = new ModelAndView();
        CourseInfo course = courseInfoController.getCourse();
        CourseOutline courseOutline = courseOutlineController.getByCourseid(course.getId());
        //返回
        mav.addObject("courseOutline",courseOutline);
        mav.setViewName("front/courseOutline");
        return mav;
    }

    @ApiOperation(value = "教学日历")
    @GetMapping("courseCalendar")
    public ModelAndView courseCalendar(){
        ModelAndView mav = new ModelAndView();
        CourseInfo course = courseInfoController.getCourse();
        CourseCalendar courseCalendar = courseCalendarController.getByCourseid(course.getId());
        //返回
        mav.addObject("courseCalendar",courseCalendar);
        mav.setViewName("front/courseCalendar");
        return mav;
    }

    @ApiOperation(value = "三级项目实施计划书")
    @GetMapping("courseLevelIIIProject")
    public ModelAndView courseLevelIIIProject(){
        ModelAndView mav = new ModelAndView();
        CourseInfo course = courseInfoController.getCourse();
        CourseLevelIIIProject courseLevelIIIProject = courseLevelIIIProjectController.getByCourseid(course.getId());
        //返回
        mav.addObject("courseLevelIIIProject",courseLevelIIIProject);
        mav.setViewName("front/courseLevelIIIProject");
        return mav;
    }

    @ApiOperation(value = "课程设计安排")
    @GetMapping("courseDesignPlan")
    public ModelAndView courseDesignPlan(){
        ModelAndView mav = new ModelAndView();
        CourseInfo course = courseInfoController.getCourse();
        CourseDesignPlan courseDesignPlan = courseDesignPlanController.getByCourseid(course.getId());
        //返回
        mav.addObject("courseDesignPlan",courseDesignPlan);
        mav.setViewName("front/courseDesignPlan");
        return mav;
    }

    @ApiOperation(value = "课程教师介绍")
    @GetMapping("courseTeacher")
    public ModelAndView courseTeacher(){
        ModelAndView mav = new ModelAndView();
        CourseInfo course = courseInfoController.getCourse();
        CourseTeacher courseTeacher = courseTeacherController.getByCourseid(course.getId());
        //返回
        mav.addObject("courseTeacher",courseTeacher);
        mav.setViewName("front/courseTeacher");
        return mav;
    }

    @ApiOperation(value = "教学视频")
    @GetMapping("subsection")
    public ModelAndView subsection(FrontDataPage frontDataPage){
        ModelAndView mav = new ModelAndView();
        Map<String, Object> map = subsectionController.getFrontPageSubsection(frontDataPage);
        //返回
        mav.addObject("subsectionList",map.get("subsectionList"));
        mav.addObject("frontDataPage",map.get("frontDataPage"));
        mav.setViewName("front/subsection");
        return mav;
    }

    @ApiOperation(value = "详细教学视频")
    @GetMapping("subsectionDetails")
    public ModelAndView subsectionDetails(String id){
        ModelAndView mav = new ModelAndView();
        Subsection subsection = subsectionController.getSubsectionById(id);
        List<Subsection> relatedSubsectionList = subsectionController.getRelatedSubsection(id);
        //返回
        mav.addObject("subsection",subsection);
        mav.addObject("relatedSubsectionList",relatedSubsectionList);
        mav.setViewName("front/subsectionDetails");
        return mav;
    }

    @ApiOperation(value = "课件资料")
    @GetMapping("material")
    public ModelAndView material(FrontDataPage frontDataPage){
        ModelAndView mav = new ModelAndView();
        Map<String, Object> map = materialController.getFrontPageMaterial(frontDataPage);
        mav.addObject("materialList",map.get("materialList"));
        mav.addObject("frontDataPage",map.get("frontDataPage"));
        mav.setViewName("front/material");
        return mav;
    }

    @ApiOperation(value = "优秀作品")
    @GetMapping("excellentWorks")
    public ModelAndView excellentWorks(FrontDataPage frontDataPage){
        ModelAndView mav = new ModelAndView();
        Map<String, Object> map = excellentWorksController.getFrontPageExcellentWorks(frontDataPage);
        mav.addObject("excellentWorksList",map.get("excellentWorksList"));
        mav.addObject("frontDataPage",map.get("frontDataPage"));
        mav.setViewName("front/excellentWorks");
        return mav;
    }

    @ApiOperation(value = "优秀作品详情")
    @GetMapping("excellentWorksDetails")
    public ModelAndView excellentWorksDetails(String id){
        ModelAndView mav = new ModelAndView();
        ExcellentWorks excellentWorks = excellentWorksController.getById(id);
        List<ExcellentWorkAttachment> excellentWorkAttachmentList = excellentWorkAttachmentController.getAttachmentByExcellentWorkId(id);
        //返回
        mav.addObject("excellentWorks",excellentWorks);
        mav.addObject("excellentWorkAttachmentList",excellentWorkAttachmentList);
        mav.setViewName("front/excellentWorksDetails");
        return mav;
    }

    @ApiOperation(value = "联系我们")
    @GetMapping("contact")
    public ModelAndView contact(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("front/contact");
        return mav;
    }

    @ApiOperation(value = "登录")
    @GetMapping("login")
    public ModelAndView login(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("front/login");
        return mav;
    }

    @ApiOperation(value = "注册")
    @GetMapping("signUp")
    public ModelAndView signUp(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("front/signUp");
        return mav;
    }

    @ApiOperation(value = "个人数据信息")
    @GetMapping("studentInfo")
    public ModelAndView studentInfo(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("front/studentInfo");
        return mav;
    }

    @ApiOperation(value = "密码修改")
    @GetMapping("updatePwd")
    public ModelAndView updatePwd(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("front/updatePwd");
        return mav;
    }

    @ApiOperation(value = "问题反馈")
    @GetMapping("questionReply")
    public ModelAndView questionReply(FrontDataPage frontDataPage, HttpSession session){
        ModelAndView mav = new ModelAndView();
        Map<String, Object> map = questionReplyController.getFrontPageQuestionReply(frontDataPage,session);
        mav.addObject("questionReplyList",map.get("questionReplyList"));
        mav.addObject("frontDataPage",map.get("frontDataPage"));
        mav.setViewName("front/questionReply");
        return mav;
    }

    @ApiOperation(value = "详细问题反馈")
    @GetMapping("questionReplyDetails")
    public ModelAndView questionReplyDetails(String id){
        ModelAndView mav = new ModelAndView();
        QuestionReply questionReply = questionReplyController.getQuestionReplyById(id);
        //返回
        mav.addObject("questionReply",questionReply);
        mav.setViewName("front/questionReplyDetails");
        return mav;
    }

    @ApiOperation(value = "忘记密码")
    @GetMapping("forgetPwd")
    public ModelAndView forgetPwd(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("front/forgetPwd");
        return mav;
    }
}
