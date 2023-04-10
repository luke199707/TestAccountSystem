package com.lc.courseonline.mapper;

import com.lc.courseonline.entity.Sclass;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-08-04
 */
public interface SclassMapper extends BaseMapper<Sclass> {

    List<Sclass> selectSclassByConditionForPage(Map<String, Object> map);

    int selectCountOfSclassByCondition(Map<String, Object> map);

    int deleteSclassByDepartment(String department);

    int deleteSclassByGrade(String grade);
}
