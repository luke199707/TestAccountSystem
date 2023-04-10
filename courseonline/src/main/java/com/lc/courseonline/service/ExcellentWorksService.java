package com.lc.courseonline.service;

import com.lc.courseonline.entity.ExcellentWorks;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-19
 */
public interface ExcellentWorksService extends IService<ExcellentWorks> {

    boolean addCheckParams(String param, String value);

    boolean editCheckParams(String param, String value, String id);
}
