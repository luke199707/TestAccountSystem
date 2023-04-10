package com.lc.courseonline.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.entity.Sclass;
import com.lc.courseonline.mapper.SclassMapper;
import com.lc.courseonline.service.SclassService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import javafx.scene.transform.Scale;
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
public class SclassServiceImpl extends ServiceImpl<SclassMapper, Sclass> implements SclassService {

    @Override
    public List<Sclass> querySclassByConditionForPage(Map<String, Object> map) {
        List<Sclass> subsectionList = baseMapper.selectSclassByConditionForPage(map);
        return subsectionList;
    }

    @Override
    public int queryCountOfSclassByCondition(Map<String, Object> map) {
        int count = baseMapper.selectCountOfSclassByCondition(map);
        return count;
    }

    @Override
    public boolean addCheckParams(String param, String value, String grade) {
        QueryWrapper<Sclass> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        wrapper.eq("grade", grade);
        Sclass sclass = baseMapper.selectOne(wrapper);
        if (sclass == null) {
            return true;
        }
        return false;
    }

    @Override
    public boolean editCheckParams(String param, String value, String id, String grade) {
        QueryWrapper<Sclass> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        wrapper.eq("grade", grade);
        wrapper.ne("id",id);
        Sclass sclass = baseMapper.selectOne(wrapper);
        if (sclass == null) {
            return true;
        }
        return false;
    }

    @Override
    public int deleteSclassByDepartment(String department) {
        int i = baseMapper.deleteSclassByDepartment(department);
        return i;
    }

    @Override
    public int deleteSclassByGrade(String grade) {
        int i = baseMapper.deleteSclassByGrade(grade);
        return i;
    }
}
