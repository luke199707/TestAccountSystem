package com.lc.courseonline.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lc.courseonline.commons.utils.*;
import com.lc.courseonline.entity.Student;
import com.lc.courseonline.service.StudentService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-12
 */
@Api(description = "学生管理")
@RestController
@RequestMapping("/courseonline/student")
public class StudentController {
    @Autowired
    private StudentService studentService;

    @Autowired
    private MailClient mailClient;

    @ApiOperation(value = "学生删除")
    @GetMapping("deleteById")
    @ResponseBody
    public String deleteById(String id){
        boolean b = studentService.removeById(id);
        if (b){
            return "success";
        }
        return "fail";
    }

    /*@ApiOperation(value = "学生分页条件查询")
    @GetMapping("pageListStudent")
    public LayuiTableData pageListStudent(long page, long limit, String sno,String name,String sortField, String order){
        //创建layui数据表格专用返回对象
        LayuiTableData layuiTableData = new LayuiTableData();
        //封装list查询条件
        QueryWrapper<Student> listWrapper = new QueryWrapper<>();
        if (sno!=null&&!("".equals(sno))){
            listWrapper.like("sno",sno);
        }
        if (name!=null&&!("".equals(name))){
            listWrapper.like("name",name);
        }
        //排序方式
        if (sortField!=null&&!("".equals(sortField))){
            if ("asc".equals(order)){
                listWrapper.orderBy(true,true,sortField);
            }else {
                listWrapper.orderBy(true,false,sortField);
            }
        }else {
            listWrapper.orderByDesc("sno");
        }
        //分页page对象
        Page<Student> pageStudent = new Page<>(page,limit);
        studentService.page(pageStudent, listWrapper);
        long total = pageStudent.getTotal();
        List<Student> data = pageStudent.getRecords();
        //返回数据封装
        layuiTableData.setCode(0);
        layuiTableData.setMsg("");
        layuiTableData.setCount(total);
        layuiTableData.setData(data);
        //返归
        return layuiTableData;
    }*/

    @ApiOperation(value = "学生分页条件查询")
    @GetMapping("pageListStudent")
    public LayuiTableData pageListStudent(long page, long limit, String sno,String name,
                                                   @RequestParam(required = false,defaultValue = "sno") String sortField,
                                                   @RequestParam(required = false,defaultValue = "asc") String order){
        //创建layui数据表格专用返回对象
        LayuiTableData layuiTableData = new LayuiTableData();
        //封装list查询条件
        Map<String, Object> map = new HashMap<>();
        map.put("sno", sno);
        map.put("name", name);
        map.put("sortField", sortField);
        map.put("order", order);
        map.put("page", page);
        map.put("limit", limit);
        List<Student> data = studentService.queryStudentByConditionForPage(map);
        int total = studentService.queryCountOfStudentByCondition(map);
        //返回数据封装
        layuiTableData.setCode(0);
        layuiTableData.setMsg("");
        layuiTableData.setCount(total);
        layuiTableData.setData(data);
        //返回
        return layuiTableData;
    }

    @ApiOperation(value = "添加时确认参数")
    @GetMapping("addCheckParams")
    @ResponseBody
    public boolean  addCheckParams(String param, String value) {
        boolean result = studentService.addCheckParams(param,value);
        return result;
    }

    @ApiOperation(value = "编辑时确认参数")
    @GetMapping("editCheckParams")
    @ResponseBody
    public boolean  editCheckParams(String param, String value,String id) {
        boolean result = studentService.editCheckParams(param,value,id);
        return result;
    }

    //---------------------------------------------------前台使用---------------------------------------------------
    @ApiOperation(value = "添加")
    @PostMapping("add")
    public ModelAndView add(Student s, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        //数据封装
        Student student = new Student();
        student.setId(UUIDUtil.getUUID());
        student.setSno(s.getSno());
        student.setName(s.getName());
        student.setPwd(MD5.encrypt(s.getPwd()));
        student.setEmail(s.getEmail());
        student.setGrade(s.getGrade());
        student.setDepartment(s.getDepartment());
        student.setSclass(s.getSclass());
        student.setSubject(s.getSubject());
        //执行DAO
        studentService.save(student);
        //将刚注册用户的信息存入session，表示已经登录
        session.setAttribute("loggingStudent",student);
        //返回
        mav.setViewName("front/index");
        return mav;
    }

    @ApiOperation(value = "修改")
    @PostMapping("edit")
    public ModelAndView edit(Student s, HttpSession session){
        ModelAndView mav = new ModelAndView();
        //封装数据
        Student student = studentService.getById(s.getId());
        student.setName(s.getName());
        student.setEmail(s.getEmail());
        student.setGrade(s.getGrade());
        student.setDepartment(s.getDepartment());
        student.setSclass(s.getSclass());
        student.setSubject(s.getSubject());
        //执行Dao
        studentService.updateById(student);
        // 更新session信息
        session.setAttribute("loggingStudent", student);
        //返回
        mav.setViewName("redirect:/frontlink/studentInfo");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "确认密码")
    @GetMapping("checkPwd")
    @ResponseBody
    public boolean  checkPwd(String pwd,HttpSession session) {
        Student loggingStudent = (Student) session.getAttribute("loggingStudent");
        if (loggingStudent.getPwd().equals(MD5.encrypt(pwd))){
            return true;
        }
        return false;
    }

    @ApiOperation(value = "更新密码")
    @PostMapping("updatePwd")
    public ModelAndView updateData(String newPwd,HttpSession session) {
        ModelAndView mav = new ModelAndView();
        //信息更新
        Student loggingStudent = (Student) session.getAttribute("loggingStudent");
        loggingStudent.setPwd(MD5.encrypt(newPwd));
        studentService.saveOrUpdate(loggingStudent);
        //返回
        session.setAttribute("loggingStudent", loggingStudent);

        mav.setViewName("redirect:/frontlink/updatePwd");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "确认学号")
    @GetMapping("checkSno")
    @ResponseBody
    public boolean  checkSno(String sno) {
        boolean result = studentService.checkSno(sno);
        return result;
    }

    @ApiOperation(value = "密码重置")
    @PostMapping("resetPwd")
    public ModelAndView resetPwd(Student s) {
        ModelAndView mav = new ModelAndView();
        //邮箱匹配检验
        Student student = studentService.checkResetPwd(s.getSno(), s.getEmail());
        if (student == null) {
            mav.addObject("errorMsg", "学号与邮箱不匹配");
            mav.addObject("sno", s.getSno());
            mav.addObject("email", s.getEmail());
            mav.setViewName("front/forgetPwd");
            return mav;
        } else {
            //密码重置
            String newPwd = RandomPwd.create(4);
            mailClient.sendMail(s.getEmail(), "密码重置", "您的密码已经重置为：" + newPwd + ",请尽快登录修改！");
            student.setPwd(MD5.encrypt(newPwd));
            studentService.saveOrUpdate(student);
            mav.addObject("flag", "success");
            mav.setViewName("front/forgetPwd");
            return mav;
        }
    }

    @ApiOperation(value = "登录")
    @PostMapping("login")
    public ModelAndView login(Student s, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        Student student = studentService.checkAccount(s.getSno(), s.getPwd());
        if (student == null) {
            mav.addObject("errorMsg", "密码错误");
            mav.addObject("sno", s.getSno());
            mav.addObject("pwd", s.getPwd());
            mav.setViewName("front/login");
            return mav;
        } else {
            session.setAttribute("loggingStudent", student);
            mav.setViewName("redirect:/frontlink/index");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
            return mav;
        }
    }

    @ApiOperation(value = "登出")
    @GetMapping("logout")
    public ModelAndView logout(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        session.removeAttribute("loggingStudent");
        mav.setViewName("front/index");
        return mav;
    }
}

