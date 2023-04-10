package com.lc.courseonline.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.entity.Subsection;
import com.lc.courseonline.mapper.SubsectionMapper;
import com.lc.courseonline.service.SubsectionService;
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
 * @since 2022-07-15
 */
@Service
public class SubsectionServiceImpl extends ServiceImpl<SubsectionMapper, Subsection> implements SubsectionService {

    @Override
    public List<Subsection> querySubsectionByConditionForPage(Map<String, Object> map) {
        List<Subsection> subsectionList = baseMapper.selectSubsectionByConditionForPage(map);
        return subsectionList;
    }

    @Override
    public int queryCountOfSubsectionByCondition(Map<String, Object> map) {
        int count = baseMapper.selectCountOfSubsectionByCondition(map);
        return count;
    }

    @Override
    public boolean addCheckParams(String param, String value) {
        QueryWrapper<Subsection> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        Subsection subsection = baseMapper.selectOne(wrapper);
        if (subsection == null) {
            return true;
        }
        return false;
    }

    @Override
    public boolean editCheckParams(String param, String value, String id) {
        QueryWrapper<Subsection> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        wrapper.ne("id",id);
        Subsection subsection = baseMapper.selectOne(wrapper);
        if (subsection == null) {
            return true;
        }
        return false;
    }

    @Override
    public int deleteSubsectionByCourseid(String courseid) {
        int i = baseMapper.deleteSubsectionByCourseid(courseid);
        return i;
    }

    @Override
    public int deleteSubsectionByChapterid(String chapterid) {
        int i = baseMapper.deleteSubsectionByChapterid(chapterid);
        return i;
    }
}
