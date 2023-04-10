package com.lc.courseonline.service;

import com.lc.courseonline.entity.Student;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-12
 */
public interface StudentService extends IService<Student> {

    boolean addCheckParams(String param, String value);

    boolean editCheckParams(String param, String value, String id);

    boolean checkSno(String sno);

    Student checkAccount(String sno,String pwd);

    Student checkResetPwd(String sno,String email);

    List<Student> getByStuName(String stuName);

    List<Student> queryStudentByConditionForPage(Map<String, Object> map);

    int queryCountOfStudentByCondition(Map<String, Object> map);
}
