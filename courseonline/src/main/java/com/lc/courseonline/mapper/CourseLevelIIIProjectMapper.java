package com.lc.courseonline.mapper;

import com.lc.courseonline.entity.CourseLevelIIIProject;
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
public interface CourseLevelIIIProjectMapper extends BaseMapper<CourseLevelIIIProject> {

    List<CourseLevelIIIProject> selectCourseLevelIIIProjectByConditionForPage(Map<String, Object> map);

    int selectCountOfCourseLevelIIIProjectByCondition(Map<String, Object> map);

    int deleteByCourseId(String courseid);
}
