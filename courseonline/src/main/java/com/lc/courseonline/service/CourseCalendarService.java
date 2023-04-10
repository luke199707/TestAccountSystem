package com.lc.courseonline.service;

import com.lc.courseonline.entity.CourseCalendar;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-08-10
 */
public interface CourseCalendarService extends IService<CourseCalendar> {

    List<CourseCalendar> queryCourseCalendarByConditionForPage(Map<String, Object> map);

    int queryCountOfCourseCalendarByCondition(Map<String, Object> map);

    boolean addCheckParams(String param, String value);

    boolean editCheckParams(String param, String value, String id);

    int deleteByCourseId(String courseid);
}
