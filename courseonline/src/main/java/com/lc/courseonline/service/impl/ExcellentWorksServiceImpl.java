package com.lc.courseonline.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.entity.ExcellentWorks;
import com.lc.courseonline.mapper.ExcellentWorksMapper;
import com.lc.courseonline.service.ExcellentWorksService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-19
 */
@Service
public class ExcellentWorksServiceImpl extends ServiceImpl<ExcellentWorksMapper, ExcellentWorks> implements ExcellentWorksService {

    @Override
    public boolean addCheckParams(String param, String value) {
        QueryWrapper<ExcellentWorks> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        ExcellentWorks works = baseMapper.selectOne(wrapper);
        if (works == null) {
            return true;
        }
        return false;
    }

    @Override
    public boolean editCheckParams(String param, String value, String id) {
        QueryWrapper<ExcellentWorks> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        wrapper.ne("id",id);
        ExcellentWorks works = baseMapper.selectOne(wrapper);
        if (works == null) {
            return true;
        }
        return false;
    }
}
