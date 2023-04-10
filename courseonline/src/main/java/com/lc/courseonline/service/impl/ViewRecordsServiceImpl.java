package com.lc.courseonline.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.entity.ViewRecords;
import com.lc.courseonline.mapper.ViewRecordsMapper;
import com.lc.courseonline.service.ViewRecordsService;
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
 * @since 2022-07-21
 */
@Service
public class ViewRecordsServiceImpl extends ServiceImpl<ViewRecordsMapper, ViewRecords> implements ViewRecordsService {

    @Override
    public List<ViewRecords> queryViewRecordsByConditionForPage(Map<String, Object> map) {
        List<ViewRecords> chapterList = baseMapper.selectViewRecordsByConditionForPage(map);
        return chapterList;
    }

    @Override
    public int queryCountOfViewRecordsByCondition(Map<String, Object> map) {
        int count = baseMapper.selectCountOfViewRecordsByCondition(map);
        return count;
    }

    @Override
    public boolean getByStuIdSubsectionId(String stuid, String subsectionid) {
        QueryWrapper<ViewRecords> wrapper = new QueryWrapper<>();
        wrapper.eq("stuid",stuid);
        wrapper.eq("subsectionid",subsectionid);
        ViewRecords records = baseMapper.selectOne(wrapper);
        if (records == null) {
            return true;
        }
        return false;
    }
}
