package com.lc.courseonline.service;

import com.lc.courseonline.entity.QuestionReply;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-20
 */
public interface QuestionReplyService extends IService<QuestionReply> {

    List<QuestionReply> queryQuestionReplyByConditionForPage(Map<String, Object> map);

    int queryCountOfQuestionReplyByCondition(Map<String, Object> map);
}
