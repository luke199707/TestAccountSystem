package com.lc.courseonline.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.entity.Chapter;
import com.lc.courseonline.mapper.ChapterMapper;
import com.lc.courseonline.service.ChapterService;
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
public class ChapterServiceImpl extends ServiceImpl<ChapterMapper, Chapter> implements ChapterService {

    @Override
    public boolean addCheckParams(String param, String value) {
        QueryWrapper<Chapter> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        Chapter chapter = baseMapper.selectOne(wrapper);
        if (chapter == null) {
            return true;
        }
        return false;
    }

    @Override
    public boolean editCheckParams(String param, String value, String id) {
        QueryWrapper<Chapter> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        wrapper.ne("id",id);
        Chapter chapter = baseMapper.selectOne(wrapper);
        if (chapter == null) {
            return true;
        }
        return false;
    }

    @Override
    public List<Chapter> queryChapterByConditionForPage(Map<String, Object> map) {
        List<Chapter> chapterList = baseMapper.selectChapterByConditionForPage(map);
        return chapterList;
    }

    @Override
    public int queryCountOfChapterByCondition(Map<String, Object> map) {
        int count = baseMapper.selectCountOfChapterByCondition(map);
        return count;
    }

    @Override
    public int deleteChapterByCourseid(String courseid) {
        int i = baseMapper.deleteChapterByCourseid(courseid);
        return i;
    }
}
