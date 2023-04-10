package com.lc.courseonline.service;

import com.lc.courseonline.entity.CourseTeacher;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-08-11
 */
public interface CourseTeacherService extends IService<CourseTeacher> {

    List<CourseTeacher> queryCourseTeacherByConditionForPage(Map<String, Object> map);

    int queryCountOfCourseTeacherByCondition(Map<String, Object> map);

    boolean addCheckParams(String param, String value);

    boolean editCheckParams(String param, String value, String id);

    int deleteByCourseId(String courseid);
}
