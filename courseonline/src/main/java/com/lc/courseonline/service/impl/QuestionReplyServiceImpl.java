package com.lc.courseonline.service.impl;

import com.lc.courseonline.entity.QuestionReply;
import com.lc.courseonline.mapper.QuestionReplyMapper;
import com.lc.courseonline.service.QuestionReplyService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-20
 */
@Service
public class QuestionReplyServiceImpl extends ServiceImpl<QuestionReplyMapper, QuestionReply> implements QuestionReplyService {

    @Override
    public List<QuestionReply> queryQuestionReplyByConditionForPage(Map<String, Object> map) {
        List<QuestionReply> questionReplyList = baseMapper.selectQuestionReplyByConditionForPage(map);
        return questionReplyList;
    }

    @Override
    public int queryCountOfQuestionReplyByCondition(Map<String, Object> map) {
        int count = baseMapper.selectCountOfQuestionReplyByCondition(map);
        return count;
    }
}
