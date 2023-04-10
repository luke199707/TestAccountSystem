package com.lc.courseonline.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.entity.CourseTeacher;
import com.lc.courseonline.mapper.CourseTeacherMapper;
import com.lc.courseonline.service.CourseTeacherService;
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
 * @since 2022-08-11
 */
@Service
public class CourseTeacherServiceImpl extends ServiceImpl<CourseTeacherMapper, CourseTeacher> implements CourseTeacherService {

    @Override
    public List<CourseTeacher> queryCourseTeacherByConditionForPage(Map<String, Object> map) {
        List<CourseTeacher> list = baseMapper.selectCourseTeacherByConditionForPage(map);
        return list;
    }

    @Override
    public int queryCountOfCourseTeacherByCondition(Map<String, Object> map) {
        int count = baseMapper.selectCountOfCourseTeacherByCondition(map);
        return count;
    }

    @Override
    public boolean addCheckParams(String param, String value) {
        QueryWrapper<CourseTeacher> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        CourseTeacher data = baseMapper.selectOne(wrapper);
        if (data == null) {
            return true;
        }
        return false;
    }

    @Override
    public boolean editCheckParams(String param, String value, String id) {
        QueryWrapper<CourseTeacher> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        wrapper.ne("id",id);
        CourseTeacher data = baseMapper.selectOne(wrapper);
        if (data == null) {
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
