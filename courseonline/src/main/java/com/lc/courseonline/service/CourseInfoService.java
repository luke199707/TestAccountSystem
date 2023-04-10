package com.lc.courseonline.service;

import com.lc.courseonline.entity.CourseInfo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-15
 */
public interface CourseInfoService extends IService<CourseInfo> {

    boolean addCheckParams(String param, String value);

    boolean editCheckParams(String param, String value, String id);
}
