package com.lc.courseonline.mapper;

import com.lc.courseonline.entity.Student;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-12
 */
public interface StudentMapper extends BaseMapper<Student> {

    List<Student> selectStudentByConditionForPage(Map<String, Object> map);

    int selectCountOfStudentByCondition(Map<String, Object> map);
}
