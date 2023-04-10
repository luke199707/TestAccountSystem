package com.lc.courseonline.service;

import com.lc.courseonline.entity.ViewRecords;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-21
 */
public interface ViewRecordsService extends IService<ViewRecords> {
    
    List<ViewRecords> queryViewRecordsByConditionForPage(Map<String, Object> map);

    int queryCountOfViewRecordsByCondition(Map<String, Object> map);

    boolean getByStuIdSubsectionId(String stuid,String subsectionid);
}
