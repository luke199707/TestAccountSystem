package com.lc.courseonline.mapper;

import com.lc.courseonline.entity.ViewRecords;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-21
 */
public interface ViewRecordsMapper extends BaseMapper<ViewRecords> {

    List<ViewRecords> selectViewRecordsByConditionForPage(Map<String, Object> map);

    int selectCountOfViewRecordsByCondition(Map<String, Object> map);
}
