package com.lc.courseonline.mapper;

import com.lc.courseonline.entity.CourseDesignPlan;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-08-10
 */
public interface CourseDesignPlanMapper extends BaseMapper<CourseDesignPlan> {

    List<CourseDesignPlan> selectCourseDesignPlanByConditionForPage(Map<String, Object> map);

    int selectCountOfCourseDesignPlanByCondition(Map<String, Object> map);

    int deleteByCourseId(String courseid);
}
