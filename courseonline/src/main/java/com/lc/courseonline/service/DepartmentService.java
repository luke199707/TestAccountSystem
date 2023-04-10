package com.lc.courseonline.service;

import com.lc.courseonline.entity.Department;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-08-04
 */
public interface DepartmentService extends IService<Department> {

    boolean addCheckParams(String param, String value);

    boolean editCheckParams(String param, String value, String id);
}
