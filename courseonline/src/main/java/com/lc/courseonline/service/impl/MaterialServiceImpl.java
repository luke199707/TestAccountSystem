package com.lc.courseonline.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.entity.Admin;
import com.lc.courseonline.entity.Material;
import com.lc.courseonline.mapper.MaterialMapper;
import com.lc.courseonline.service.MaterialService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-15
 */
@Service
public class MaterialServiceImpl extends ServiceImpl<MaterialMapper, Material> implements MaterialService {

    @Override
    public boolean checkParams(String param, String value) {
        QueryWrapper<Material> wrapper = new QueryWrapper<>();
        wrapper.eq(param,value);
        Material material = baseMapper.selectOne(wrapper);
        if (material == null) {
            return true;
        }
        return false;
    }
}
