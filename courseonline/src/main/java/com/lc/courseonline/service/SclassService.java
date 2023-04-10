package com.lc.courseonline.service;

import com.lc.courseonline.entity.Sclass;
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
public interface SclassService extends IService<Sclass> {

    List<Sclass> querySclassByConditionForPage(Map<String, Object> map);

    int queryCountOfSclassByCondition(Map<String, Object> map);

    boolean addCheckParams(String param, String value, String grade);

    boolean editCheckParams(String param, String value, String id, String grade);

    int deleteSclassByDepartment(String department);

    int deleteSclassByGrade(String grade);
}
