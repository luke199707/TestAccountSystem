package com.lc.courseonline.mapper;

import com.lc.courseonline.entity.CourseOutline;
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
public interface CourseOutlineMapper extends BaseMapper<CourseOutline> {

    List<CourseOutline> selectCourseOutlineByConditionForPage(Map<String, Object> map);

    int selectCountOfCourseOutlineByCondition(Map<String, Object> map);

    int deleteByCourseId(String courseid);
}
