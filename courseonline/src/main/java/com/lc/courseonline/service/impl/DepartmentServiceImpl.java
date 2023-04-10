package com.lc.courseonline.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.entity.Department;
import com.lc.courseonline.mapper.DepartmentMapper;
import com.lc.courseonline.service.DepartmentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-08-04
 */
@Service
public class DepartmentServiceImpl extends ServiceImpl<DepartmentMapper, Department> implements DepartmentService {

    @Override
    public boolean addCheckParams(String param, String value) {
        QueryWrapper<Department> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        Department department = baseMapper.selectOne(wrapper);
        if (department == null) {
            return true;
        }
        return false;
    }

    @Override
    public boolean editCheckParams(String param, String value, String id) {
        QueryWrapper<Department> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        wrapper.ne("id",id);
        Department department = baseMapper.selectOne(wrapper);
        if (department == null) {
            return true;
        }
        return false;
    }
}
