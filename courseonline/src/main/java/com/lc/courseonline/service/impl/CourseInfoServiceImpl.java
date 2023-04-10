package com.lc.courseonline.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.entity.CourseInfo;
import com.lc.courseonline.mapper.CourseInfoMapper;
import com.lc.courseonline.service.CourseInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-15
 */
@Service
public class CourseInfoServiceImpl extends ServiceImpl<CourseInfoMapper, CourseInfo> implements CourseInfoService {

    @Override
    public boolean addCheckParams(String param, String value) {
        QueryWrapper<CourseInfo> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        CourseInfo course = baseMapper.selectOne(wrapper);
        if (course == null) {
            return true;
        }
        return false;
    }

    @Override
    public boolean editCheckParams(String param, String value, String id) {
        QueryWrapper<CourseInfo> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        wrapper.ne("id",id);
        CourseInfo course = baseMapper.selectOne(wrapper);
        if (course == null) {
            return true;
        }
        return false;
    }
}
