package com.lc.courseonline.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.entity.CourseDesignPlan;
import com.lc.courseonline.mapper.CourseDesignPlanMapper;
import com.lc.courseonline.service.CourseDesignPlanService;
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
public class CourseDesignPlanServiceImpl extends ServiceImpl<CourseDesignPlanMapper, CourseDesignPlan> implements CourseDesignPlanService {

    @Override
    public List<CourseDesignPlan> queryCourseDesignPlanByConditionForPage(Map<String, Object> map) {
        List<CourseDesignPlan> list = baseMapper.selectCourseDesignPlanByConditionForPage(map);
        return list;
    }

    @Override
    public int queryCountOfCourseDesignPlanByCondition(Map<String, Object> map) {
        int count = baseMapper.selectCountOfCourseDesignPlanByCondition(map);
        return count;
    }

    @Override
    public boolean addCheckParams(String param, String value) {
        QueryWrapper<CourseDesignPlan> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        CourseDesignPlan data = baseMapper.selectOne(wrapper);
        if (data == null) {
            return true;
        }
        return false;
    }

    @Override
    public boolean editCheckParams(String param, String value, String id) {
        QueryWrapper<CourseDesignPlan> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        wrapper.ne("id",id);
        CourseDesignPlan data = baseMapper.selectOne(wrapper);
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
