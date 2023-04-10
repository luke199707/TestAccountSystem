package com.lc.courseonline.mapper;

import com.lc.courseonline.entity.Subsection;
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
public interface SubsectionMapper extends BaseMapper<Subsection> {
    /**
     * 分页条件查询
     * @param map
     * @return
     */
    List<Subsection> selectSubsectionByConditionForPage(Map<String,Object> map);

    /**
     * 条件统计
     * @param map
     * @return
     */
    int selectCountOfSubsectionByCondition(Map<String,Object> map);

    /**
     * 通过courseid删除
     * @param courseid
     * @return
     */
    int deleteSubsectionByCourseid(String courseid);

    /**
     * 通过chapterid删除
     * @param chapterid
     * @return
     */
    int deleteSubsectionByChapterid(String chapterid);
}
