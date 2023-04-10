package com.lc.courseonline.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.commons.utils.MD5;
import com.lc.courseonline.entity.Admin;
import com.lc.courseonline.mapper.AdminMapper;
import com.lc.courseonline.service.AdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-08
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements AdminService {
    @Override
    public boolean checkNickname(String nickname) {
        QueryWrapper<Admin> wrapper = new QueryWrapper<>();
        wrapper.eq("nickname",nickname);
        Integer count = baseMapper.selectCount(wrapper);
        if (count > 0) {
            return true;
        }
        return false;
    }

    @Override
    public Admin checkAccount(String nickname, String pwd) {
        QueryWrapper<Admin> wrapper = new QueryWrapper<>();
        wrapper.eq("nickname",nickname);
        wrapper.eq("pwd", MD5.encrypt(pwd));
        Admin admin = baseMapper.selectOne(wrapper);
        return admin;
    }

    @Override
    public Admin checkResetPwd(String nickname, String email) {
        QueryWrapper<Admin> wrapper = new QueryWrapper<>();
        wrapper.eq("nickname",nickname);
        wrapper.eq("email", email);
        Admin admin = baseMapper.selectOne(wrapper);
        return admin;
    }

    @Override
    public boolean checkParams(String param, String value, Admin loggingUser) {
        QueryWrapper<Admin> wrapper = new QueryWrapper<>();
        wrapper.eq(param,value);
        wrapper.ne("id",loggingUser.getId());
        Admin admin = baseMapper.selectOne(wrapper);
        if (admin == null) {
            return true;
        }
        return false;
    }
}
