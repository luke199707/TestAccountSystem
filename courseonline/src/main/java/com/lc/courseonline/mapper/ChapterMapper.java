package com.lc.courseonline.mapper;

import com.lc.courseonline.entity.Chapter;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-15
 */
public interface ChapterMapper extends BaseMapper<Chapter> {
    /**
     * 分页条件查询
     * @param map
     * @return
     */
    List<Chapter> selectChapterByConditionForPage(Map<String,Object> map);

    /**
     * 条件统计
     * @param map
     * @return
     */
    int selectCountOfChapterByCondition(Map<String,Object> map);

    /**
     * 通过courseid删除
     * @param courseid
     * @return
     */
    int deleteChapterByCourseid(String courseid);
}
