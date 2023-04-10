package com.lc.courseonline.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.entity.Grade;
import com.lc.courseonline.mapper.GradeMapper;
import com.lc.courseonline.service.GradeService;
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
 * @since 2022-08-04
 */
@Service
public class GradeServiceImpl extends ServiceImpl<GradeMapper, Grade> implements GradeService {

    @Override
    public List<Grade> queryGradeByConditionForPage(Map<String, Object> map) {
        List<Grade> gradeList = baseMapper.selectGradeByConditionForPage(map);
        return gradeList;
    }

    @Override
    public int queryCountOfGradeByCondition(Map<String, Object> map) {
        int count = baseMapper.selectCountOfGradeByCondition(map);
        return count;
    }

    @Override
    public boolean addCheckParams(String param, String value,String department) {
        QueryWrapper<Grade> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        wrapper.eq("department", department);
        Grade grade = baseMapper.selectOne(wrapper);
        if (grade == null) {
            return true;
        }
        return false;
    }

    @Override
    public boolean editCheckParams(String param, String value, String id,String department) {
        QueryWrapper<Grade> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        wrapper.eq("department", department);
        wrapper.ne("id",id);
        Grade grade = baseMapper.selectOne(wrapper);
        if (grade == null) {
            return true;
        }
        return false;
    }

    @Override
    public int deleteGradeByDepartmentId(String departmentId) {
        int i = baseMapper.deleteGradeByDepartmentId(departmentId);
        return i;
    }
}
