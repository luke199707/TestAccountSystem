package com.lc.courseonline.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.entity.CourseLevelIIIProject;
import com.lc.courseonline.mapper.CourseLevelIIIProjectMapper;
import com.lc.courseonline.service.CourseLevelIIIProjectService;
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
public class CourseLevelIIIProjectServiceImpl extends ServiceImpl<CourseLevelIIIProjectMapper, CourseLevelIIIProject> implements CourseLevelIIIProjectService {

    @Override
    public List<CourseLevelIIIProject> queryCourseLevelIIIProjectByConditionForPage(Map<String, Object> map) {
        List<CourseLevelIIIProject> list = baseMapper.selectCourseLevelIIIProjectByConditionForPage(map);
        return list;
    }

    @Override
    public int queryCountOfCourseLevelIIIProjectByCondition(Map<String, Object> map) {
        int count = baseMapper.selectCountOfCourseLevelIIIProjectByCondition(map);
        return count;
    }

    @Override
    public boolean addCheckParams(String param, String value) {
        QueryWrapper<CourseLevelIIIProject> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        CourseLevelIIIProject data = baseMapper.selectOne(wrapper);
        if (data == null) {
            return true;
        }
        return false;
    }

    @Override
    public boolean editCheckParams(String param, String value, String id) {
        QueryWrapper<CourseLevelIIIProject> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        wrapper.ne("id",id);
        CourseLevelIIIProject data = baseMapper.selectOne(wrapper);
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
