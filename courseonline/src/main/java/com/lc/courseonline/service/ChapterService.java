package com.lc.courseonline.service;

import com.lc.courseonline.entity.Chapter;
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
public interface ChapterService extends IService<Chapter> {

    boolean addCheckParams(String param, String value);

    boolean editCheckParams(String param, String value, String id);

    List<Chapter> queryChapterByConditionForPage(Map<String,Object> map);

    int queryCountOfChapterByCondition(Map<String,Object> map);

    int deleteChapterByCourseid(String courseid);
}
