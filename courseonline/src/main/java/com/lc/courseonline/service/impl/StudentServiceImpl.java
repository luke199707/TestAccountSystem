package com.lc.courseonline.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.commons.utils.MD5;
import com.lc.courseonline.entity.ExcellentWorks;
import com.lc.courseonline.entity.Student;
import com.lc.courseonline.mapper.StudentMapper;
import com.lc.courseonline.service.StudentService;
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
 * @since 2022-07-12
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements StudentService {

    @Override
    public boolean addCheckParams(String param, String value) {
        QueryWrapper<Student> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        Student student = baseMapper.selectOne(wrapper);
        if (student == null) {
            return true;
        }
        return false;
    }

    @Override
    public boolean editCheckParams(String param, String value, String id) {
        QueryWrapper<Student> wrapper = new QueryWrapper<>();
        wrapper.eq(param, value);
        wrapper.ne("id",id);
        Student student = baseMapper.selectOne(wrapper);
        if (student == null) {
            return true;
        }
        return false;
    }

    @Override
    public boolean checkSno(String sno) {
        QueryWrapper<Student> wrapper = new QueryWrapper<>();
        wrapper.eq("sno", sno);
        Student student = baseMapper.selectOne(wrapper);
        if (student == null) {
            return false;
        }
        return true;
    }

    @Override
    public Student checkAccount(String sno, String pwd) {
        QueryWrapper<Student> wrapper = new QueryWrapper<>();
        wrapper.eq("sno",sno);
        wrapper.eq("pwd", MD5.encrypt(pwd));
        Student student = baseMapper.selectOne(wrapper);
        return student;
    }

    @Override
    public Student checkResetPwd(String sno, String email) {
        QueryWrapper<Student> wrapper = new QueryWrapper<>();
        wrapper.eq("sno",sno);
        wrapper.eq("email", email);
        Student student = baseMapper.selectOne(wrapper);
        return student;
    }

    @Override
    public List<Student> getByStuName(String stuName) {
        QueryWrapper<Student> wrapper = new QueryWrapper<>();
        wrapper.eq("name",stuName);
        List<Student> studentList = baseMapper.selectList(wrapper);
        return studentList;
    }

    @Override
    public List<Student> queryStudentByConditionForPage(Map<String, Object> map) {
        List<Student> studentList = baseMapper.selectStudentByConditionForPage(map);
        return studentList;
    }

    @Override
    public int queryCountOfStudentByCondition(Map<String, Object> map) {
        int count = baseMapper.selectCountOfStudentByCondition(map);
        return count;
    }
}
