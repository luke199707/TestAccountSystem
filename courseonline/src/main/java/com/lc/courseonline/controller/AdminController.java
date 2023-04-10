package com.lc.courseonline.controller;


import com.lc.courseonline.commons.utils.MD5;
import com.lc.courseonline.commons.utils.MailClient;
import com.lc.courseonline.commons.utils.RandomPwd;
import com.lc.courseonline.entity.Admin;
import com.lc.courseonline.service.AdminService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-08
 */
@Api(description = "admin管理")
@RestController
@RequestMapping("/courseonline/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @Autowired
    private MailClient mailClient;

    @ApiOperation(value = "登录校验")
    @PostMapping("login")
    public ModelAndView login(Admin admin, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        boolean result = adminService.checkNickname(admin.getNickname());
        if (result == false) {
            mav.addObject("nameError", "该用户名不存在");
            mav.addObject("nickname", admin.getNickname());
            mav.addObject("pwd", admin.getPwd());
            mav.setViewName("back/login");
            return mav;
        }
        Admin user = adminService.checkAccount(admin.getNickname(), admin.getPwd());
        if (user == null) {
            mav.addObject("pwdError", "密码错误");
            mav.addObject("nickname", admin.getNickname());
            mav.addObject("pwd", admin.getPwd());
            mav.setViewName("back/login");
            return mav;
        } else {
            session.setAttribute("loggingUser", user);
            mav.setViewName("back/index");
            return mav;
        }
    }

    @ApiOperation(value = "密码重置")
    @PostMapping("resetPwd")
    public ModelAndView resetPwd(Admin admin) {
        ModelAndView mav = new ModelAndView();
        //用户名检验
        boolean result = adminService.checkNickname(admin.getNickname());
        if (result == false) {
            mav.addObject("nameError", "该用户名不存在");
            mav.addObject("nickname", admin.getNickname());
            mav.addObject("email", admin.getEmail());
            mav.setViewName("back/forgetPwd");
            return mav;
        }
        //邮箱匹配检验
        Admin user = adminService.checkResetPwd(admin.getNickname(), admin.getEmail());
        if (user == null) {
            mav.addObject("emailError", "用户与邮箱不匹配");
            mav.addObject("nickname", admin.getNickname());
            mav.addObject("email", admin.getEmail());
            mav.setViewName("back/forgetPwd");
            return mav;
        } else {
            //密码重置
            String newPwd = RandomPwd.create(4);
            mailClient.sendMail(admin.getEmail(), "密码重置", "您的密码已经重置为：" + newPwd + ",请尽快修改！");
            user.setPwd(MD5.encrypt(newPwd));
            adminService.saveOrUpdate(user);
            mav.addObject("flag", "success");
            mav.setViewName("back/forgetPwd");
            return mav;
        }
    }

    @ApiOperation(value = "更新个人信息")
    @PostMapping("updateData")
    public ModelAndView updateData(Admin admin,HttpSession session) {
        ModelAndView mav = new ModelAndView();
        //信息更新
        Admin user = adminService.getById(admin.getId());
        user.setName(admin.getName());
        user.setNickname(admin.getNickname());
        user.setEmail(admin.getEmail());
        adminService.saveOrUpdate(user);
        //返回
        session.setAttribute("loggingUser", user);
        mav.setViewName("redirect:/backlink/adminInfo");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "更新密码")
    @PostMapping("updatePwd")
    public ModelAndView updateData(String newPwd,HttpSession session) {
        ModelAndView mav = new ModelAndView();
        //信息更新
        Admin loggingUser = (Admin) session.getAttribute("loggingUser");
        loggingUser.setPwd(MD5.encrypt(newPwd));
        adminService.saveOrUpdate(loggingUser);
        //返回
        session.setAttribute("loggingUser", loggingUser);

        mav.addObject("flag","success");
        mav.setViewName("redirect:/backlink/updatePwd");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "确认参数")
    @GetMapping("checkParams")
    @ResponseBody
    public boolean  checkParams(String param,String value,HttpSession session) {
        Admin loggingUser = (Admin) session.getAttribute("loggingUser");
        boolean result = adminService.checkParams(param,value,loggingUser);
        return result;
    }

    @ApiOperation(value = "确认密码")
    @GetMapping("checkPwd")
    @ResponseBody
    public boolean  checkPwd(String pwd,HttpSession session) {
        Admin loggingUser = (Admin) session.getAttribute("loggingUser");
        if (loggingUser.getPwd().equals(MD5.encrypt(pwd))){
            return true;
        }
        return false;
    }

    @ApiOperation(value = "登出")
    @GetMapping("logout")
    public ModelAndView logout(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        session.removeAttribute("loggingUser");
        mav.setViewName("back/login");
        return mav;
    }
}



