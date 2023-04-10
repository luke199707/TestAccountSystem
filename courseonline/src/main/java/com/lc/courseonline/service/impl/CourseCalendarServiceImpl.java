package com.lc.courseonline.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.entity.CourseCalendar;
import com.lc.courseonline.entity.CourseOutline;
import com.lc.courseonline.mapper.CourseCalendarMapper;
import com.lc.courseonline.service.CourseCalendarService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-08-10
 */
@Service
public class CourseCalendarServiceImpl extends ServiceImpl<CourseCalendarMapper, CourseCalendar> implements CourseCalendarService {

    @Override
    public List<CourseCalendar> queryCourseCalendarByConditionForPage(Map<String, Object> map) {
        List<CourseCalendar> courseCalendarList = baseMapper.selectCourseCalendarByConditionForPage(map);
        return courseCalendarList;
    }

    @Override
    public int queryCountOfCourseCalendarByCondition(Map<String, Object> map) {
        int count = baseMapper.selectCountOfCourseCalendarByCondition(map);
        return count;
    }

    @Override
    public boolean addCheckParams(String param, String value) {
        QueryWrapper<CourseCalendar> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        CourseCalendar courseCalendar = baseMapper.selectOne(wrapper);
        if (courseCalendar == null) {
            return true;
        }
        return false;
    }

    @Override
    public boolean editCheckParams(String param, String value, String id) {
        QueryWrapper<CourseCalendar> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        wrapper.ne("id",id);
        CourseCalendar courseCalendar = baseMapper.selectOne(wrapper);
        if (courseCalendar == null) {
            return true;
        }
        return false;
    }

    @Override
    public int deleteByCourseId(String courseid) {
        int i = baseMapper.deleteByCourseId(courseid);
        return i;
    }
}
