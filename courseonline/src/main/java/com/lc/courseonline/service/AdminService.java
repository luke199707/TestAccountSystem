package com.lc.courseonline.service;

import com.lc.courseonline.entity.Admin;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-04
 */
public interface AdminService extends IService<Admin> {
    boolean checkNickname(String nickname);
    Admin checkAccount(String nickname,String pwd);
    Admin checkResetPwd(String nickname,String email);
    boolean checkParams(String param, String value,Admin loggingUser);
}
