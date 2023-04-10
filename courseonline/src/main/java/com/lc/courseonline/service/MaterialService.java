package com.lc.courseonline.service;

import com.lc.courseonline.entity.Material;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-15
 */
public interface MaterialService extends IService<Material> {

    boolean checkParams(String param, String value);
}
