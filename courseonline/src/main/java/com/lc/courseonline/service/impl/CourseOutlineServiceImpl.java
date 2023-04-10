package com.lc.courseonline.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.entity.Chapter;
import com.lc.courseonline.entity.CourseOutline;
import com.lc.courseonline.mapper.CourseOutlineMapper;
import com.lc.courseonline.service.CourseOutlineService;
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
public class CourseOutlineServiceImpl extends ServiceImpl<CourseOutlineMapper, CourseOutline> implements CourseOutlineService {

    @Override
    public List<CourseOutline> queryCourseOutlineByConditionForPage(Map<String, Object> map) {
        List<CourseOutline> courseOutlineList = baseMapper.selectCourseOutlineByConditionForPage(map);
        return courseOutlineList;
    }

    @Override
    public int queryCountOfCourseOutlineByCondition(Map<String, Object> map) {
        int count = baseMapper.selectCountOfCourseOutlineByCondition(map);
        return count;
    }

    @Override
    public boolean addCheckParams(String param, String value) {
        QueryWrapper<CourseOutline> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        CourseOutline courseOutline = baseMapper.selectOne(wrapper);
        if (courseOutline == null) {
            return true;
        }
        return false;
    }

    @Override
    public boolean editCheckParams(String param, String value, String id) {
        QueryWrapper<CourseOutline> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        wrapper.ne("id",id);
        CourseOutline courseOutline = baseMapper.selectOne(wrapper);
        if (courseOutline == null) {
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
