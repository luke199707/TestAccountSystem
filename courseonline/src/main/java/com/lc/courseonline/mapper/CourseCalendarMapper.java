package com.lc.courseonline.mapper;

import com.lc.courseonline.entity.CourseCalendar;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-08-10
 */
public interface CourseCalendarMapper extends BaseMapper<CourseCalendar> {

    List<CourseCalendar> selectCourseCalendarByConditionForPage(Map<String, Object> map);

    int selectCountOfCourseCalendarByCondition(Map<String, Object> map);

    int deleteByCourseId(String courseid);
}
