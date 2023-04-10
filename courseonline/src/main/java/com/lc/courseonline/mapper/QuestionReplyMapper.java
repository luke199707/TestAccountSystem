package com.lc.courseonline.mapper;

import com.lc.courseonline.entity.QuestionReply;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-20
 */
public interface QuestionReplyMapper extends BaseMapper<QuestionReply> {

    /**
     * 分页条件查询
     * @param map
     * @return
     */
    List<QuestionReply> selectQuestionReplyByConditionForPage(Map<String, Object> map);

    /**
     * 分页条件统计
     * @param map
     * @return
     */
    int selectCountOfQuestionReplyByCondition(Map<String, Object> map);
}
