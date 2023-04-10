package com.lc.courseonline.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.commons.utils.LayuiTableData;
import com.lc.courseonline.commons.utils.UUIDUtil;
import com.lc.courseonline.entity.Grade;
import com.lc.courseonline.service.GradeService;
import com.lc.courseonline.service.SclassService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-08-04
 */
@Api(description = "年级管理")
@RestController
@RequestMapping("/courseonline/grade")
public class GradeController {

    @Autowired
    private GradeService gradeService;

    @Autowired
    private SclassService sclassService;

    @ApiOperation(value = "添加")
    @PostMapping("add")
    public ModelAndView add(String department, String name) {
        ModelAndView mav = new ModelAndView();
        //封装数据
        Grade grade = new Grade();
        grade.setId(UUIDUtil.getUUID());
        grade.setDepartment(department);
        grade.setName(name);
        //执行Dao
        gradeService.save(grade);
        //返回
        mav.setViewName("redirect:/backlink/grade");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "删除")
    @GetMapping("deleteById")
    @ResponseBody
    public String deleteById(String id) {
        //先删除班级信息
        sclassService.deleteSclassByGrade(id);
        //再删除年级信息
        if (gradeService.removeById(id)) {
            return "success";
        }
        return "fail";
    }

    @ApiOperation(value = "修改")
    @PostMapping("edit")
    public ModelAndView edit(String id, String department, String name) {
        ModelAndView mav = new ModelAndView();
        //封装数据
        Grade grade = gradeService.getById(id);
        grade.setDepartment(department);
        grade.setName(name);
        //执行Dao
        gradeService.updateById(grade);
        //返回
        mav.setViewName("redirect:/backlink/grade");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "分页条件查询")
    @GetMapping("pageListConditionGrade")
    public LayuiTableData pageListConditionGrade(long page, long limit, String name,
                                                   @RequestParam(required = false, defaultValue = "create_time") String sortField,
                                                   @RequestParam(required = false, defaultValue = "asc") String order) {
        //创建layui数据表格专用返回对象
        LayuiTableData layuiTableData = new LayuiTableData();
        //封装list查询条件
        Map<String, Object> map = new HashMap<>();
        map.put("name", name);
        map.put("sortField", sortField);
        map.put("order", order);
        map.put("page", page);
        map.put("limit", limit);
        List<Grade> data = gradeService.queryGradeByConditionForPage(map);
        int total = gradeService.queryCountOfGradeByCondition(map);
        //返回数据封装
        layuiTableData.setCode(0);
        layuiTableData.setMsg("");
        layuiTableData.setCount(total);
        layuiTableData.setData(data);
        //返回
        return layuiTableData;
    }

    @ApiOperation(value = "通过学院id获取")
    @GetMapping("getByDepartmentId")
    @ResponseBody
    public List<Grade> getByDepartmentId(String departmentId) {
        QueryWrapper<Grade> wrapper = new QueryWrapper<>();
        wrapper.orderByAsc("create_time");
        wrapper.eq("department", departmentId);
        List<Grade> chapterList = gradeService.list(wrapper);
        return chapterList;
    }

    @ApiOperation(value = "通过年级名称和学院id获取年级id")
    @GetMapping("getIdByNameDepartment")
    @ResponseBody
    public String getIdByNameDepartment(String name,String department) {
        QueryWrapper<Grade> wrapper = new QueryWrapper<>();
        wrapper.eq("name",name);
        wrapper.eq("department",department);
        Grade one = gradeService.getOne(wrapper);
        return one.getId();
    }

    @ApiOperation(value = "添加时确认参数")
    @GetMapping("addCheckParams")
    @ResponseBody
    public boolean addCheckParams(String param, String value,String department) {
        boolean result = gradeService.addCheckParams(param, value,department);
        return result;
    }

    @ApiOperation(value = "编辑时确认参数")
    @GetMapping("editCheckParams")
    @ResponseBody
    public boolean editCheckParams(String param, String value, String id,String department) {
        boolean result = gradeService.editCheckParams(param, value, id, department);
        return result;
    }
}

