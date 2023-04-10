package com.lc.courseonline.service;

import com.lc.courseonline.entity.Subsection;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-15
 */
public interface SubsectionService extends IService<Subsection> {

    List<Subsection> querySubsectionByConditionForPage(Map<String, Object> map);

    int queryCountOfSubsectionByCondition(Map<String, Object> map);

    boolean addCheckParams(String param, String value);

    boolean editCheckParams(String param, String value, String id);

    int deleteSubsectionByCourseid(String courseid);

    int deleteSubsectionByChapterid(String chapterid);
}
