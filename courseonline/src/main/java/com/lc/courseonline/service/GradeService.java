package com.lc.courseonline.service;

import com.lc.courseonline.entity.Grade;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-08-04
 */
public interface GradeService extends IService<Grade> {

    List<Grade> queryGradeByConditionForPage(Map<String, Object> map);

    int queryCountOfGradeByCondition(Map<String, Object> map);

    boolean addCheckParams(String param, String value,String department);

    boolean editCheckParams(String param, String value, String id,String department);

    int deleteGradeByDepartmentId(String departmentId);
}
