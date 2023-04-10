package com.lc.courseonline.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lc.courseonline.commons.utils.LayuiTableData;
import com.lc.courseonline.commons.utils.UUIDUtil;
import com.lc.courseonline.entity.Admin;
import com.lc.courseonline.entity.FrontDataPage;
import com.lc.courseonline.entity.QuestionReply;
import com.lc.courseonline.entity.Student;
import com.lc.courseonline.service.QuestionReplyService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-20
 */
@Api(description = "问题反馈管理")
@RestController
@RequestMapping("/courseonline/questionReply")
public class QuestionReplyController {
    @Autowired
    private QuestionReplyService questionReplyService;

    @ApiOperation(value = "问题添加")
    @PostMapping("add")
    public ModelAndView add(QuestionReply qr) {
        ModelAndView mav = new ModelAndView();
        //封装数据
        QuestionReply question = new QuestionReply();
        question.setId(UUIDUtil.getUUID());
        question.setQuestion(qr.getQuestion());
        question.setQuestioner(qr.getQuestioner());
        question.setState("未回复");
        question.setQtime(new Date());
        //执行Dao
        questionReplyService.save(question);
        //返回
        mav.setViewName("redirect:/backlink/questionReply");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "问题删除")
    @GetMapping("deleteById")
    @ResponseBody
    public String deleteById(String id) {
        boolean b = questionReplyService.removeById(id);
        if (b) {
            return "success";
        }
        return "fail";
    }

    @ApiOperation(value = "问题回复")
    @PostMapping("edit")
    public ModelAndView edit(QuestionReply qr,HttpSession session) {
        ModelAndView mav = new ModelAndView();
        Admin loggingUser = (Admin) session.getAttribute("loggingUser");
        //封装数据
        QuestionReply reply = questionReplyService.getById(qr.getId());
        reply.setAnswer(qr.getAnswer());
        reply.setResponder(loggingUser.getId());
        reply.setAtime(new Date());
        reply.setState("已回复");
        //执行Dao
        questionReplyService.updateById(reply);
        //返回
        mav.setViewName("redirect:/backlink/questionReply");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "问题与回复分页条件查询")
    @GetMapping("pageListQuestionReply")
    public LayuiTableData pageListQuestionReply(long page, long limit,String title, String question, String state,
                                                   @RequestParam(required = false,defaultValue = "qtime") String sortField,
                                                   @RequestParam(required = false,defaultValue = "desc") String order){
        //创建layui数据表格专用返回对象
        LayuiTableData layuiTableData = new LayuiTableData();
        //封装list查询条件
        Map<String, Object> map = new HashMap<>();
        map.put("title", title);
        map.put("question", question);
        map.put("state", state);
        map.put("sortField", sortField);
        map.put("order", order);
//        map.put("page", (page - 1) * limit);//使用offset关键字分页时使用
        map.put("page", page);
        map.put("limit", limit);
        List<QuestionReply> data = questionReplyService.queryQuestionReplyByConditionForPage(map);
        int total = questionReplyService.queryCountOfQuestionReplyByCondition(map);
        //返回数据封装
        layuiTableData.setCode(0);
        layuiTableData.setMsg("");
        layuiTableData.setCount(total);
        layuiTableData.setData(data);
        //返回
        return layuiTableData;
    }

    //---------------------------------------------------前台使用---------------------------------------------------

    @ApiOperation(value = "联系我们")
    @PostMapping("contact")
    public ModelAndView contact(String title,String question, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        Student loggingStudent = (Student) session.getAttribute("loggingStudent");
        //封装数据
        QuestionReply questionReply = new QuestionReply();
        questionReply.setId(UUIDUtil.getUUID());
        questionReply.setTitle(title);
        questionReply.setQuestion(question);
        questionReply.setQuestioner(loggingStudent.getId());
        questionReply.setState("未回复");
        questionReply.setQtime(new Date());
        //执行Dao
        questionReplyService.save(questionReply);
        //返回
        mav.setViewName("redirect:/frontlink/contact");//重定向到跳转FrontLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "前台分页条件查询问题反馈")
    @GetMapping("getFrontPageQuestionReply")
    @ResponseBody
    public Map<String, Object> getFrontPageQuestionReply(FrontDataPage frontDataPage, HttpSession session) {
        Student loggingStudent = (Student) session.getAttribute("loggingStudent");

        QueryWrapper<QuestionReply> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("qtime");
        wrapper.eq("questioner",loggingStudent.getId());
        // 分页page对象
        Page<QuestionReply> pageQuestionReply = new Page<>(frontDataPage.getCurrent(),frontDataPage.getLimit());
        questionReplyService.page(pageQuestionReply, wrapper);
        long total = pageQuestionReply.getTotal();
        List<QuestionReply> questionReplyList = pageQuestionReply.getRecords();
        // 前台分页对象
        frontDataPage.setRows(total);
        frontDataPage.setPath("/frontlink/questionReply");

        HashMap<String, Object> map = new HashMap<>();
        map.put("frontDataPage",frontDataPage);
        map.put("questionReplyList",questionReplyList);
        return map;
    }

    @ApiOperation(value = "前台查询问题反馈")
    @GetMapping("getQuestionReplyById")
    @ResponseBody
    public QuestionReply getQuestionReplyById(String id){
        QuestionReply questionReply = questionReplyService.getById(id);
        return questionReply;
    }
}

