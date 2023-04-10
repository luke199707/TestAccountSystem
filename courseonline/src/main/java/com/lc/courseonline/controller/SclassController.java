package com.lc.courseonline.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lc.courseonline.commons.utils.LayuiTableData;
import com.lc.courseonline.commons.utils.UUIDUtil;
import com.lc.courseonline.entity.Sclass;
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
 *  前端控制器
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-08-04
 */
@Api(description = "班级管理")
@RestController
@RequestMapping("/courseonline/sclass")
public class SclassController {

    @Autowired
    private SclassService sclassService;

    @ApiOperation(value = "添加")
    @PostMapping("add")
    public ModelAndView add(String department,String grade,String name){
        ModelAndView mav = new ModelAndView();
        //封装数据
        Sclass sclass = new Sclass();
        sclass.setId(UUIDUtil.getUUID());
        sclass.setDepartment(department);
        sclass.setGrade(grade);
        sclass.setName(name);
        //执行Dao
        sclassService.save(sclass);
        //返回
        mav.setViewName("redirect:/backlink/sclass");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "删除")
    @GetMapping("deleteById")
    @ResponseBody
    public String deleteById(String id){
        if (sclassService.removeById(id)) {
            return "success";
        }
        return "fail";
    }

    @ApiOperation(value = "修改")
    @PostMapping("edit")
    public ModelAndView edit(String id,String department,String grade,String name){
        ModelAndView mav = new ModelAndView();
        //封装数据
        Sclass sclass = sclassService.getById(id);
        sclass.setDepartment(department);
        sclass.setGrade(grade);
        sclass.setName(name);
        //执行Dao
        sclassService.updateById(sclass);
        //返回
        mav.setViewName("redirect:/backlink/sclass");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "分页条件查询")
    @GetMapping("pageListConditionSclass")
    public LayuiTableData pageListConditionSclass(long page, long limit, String name,
                                                      @RequestParam(required = false,defaultValue = "create_time") String sortField,
                                                      @RequestParam(required = false,defaultValue = "asc") String order){
        //创建layui数据表格专用返回对象
        LayuiTableData layuiTableData = new LayuiTableData();
        //封装list查询条件
        Map<String, Object> map = new HashMap<>();
        map.put("name", name);
        map.put("sortField", sortField);
        map.put("order", order);
        map.put("page", page);
        map.put("limit", limit);
        List<Sclass> data = sclassService.querySclassByConditionForPage(map);
        int total = sclassService.queryCountOfSclassByCondition(map);
        //返回数据封装
        layuiTableData.setCode(0);
        layuiTableData.setMsg("");
        layuiTableData.setCount(total);
        layuiTableData.setData(data);
        //返回
        return layuiTableData;
    }

    @ApiOperation(value = "通过年级id获取")
    @GetMapping("getByGrade")
    @ResponseBody
    public List<Sclass> getByGrade(String grade) {
        QueryWrapper<Sclass> wrapper = new QueryWrapper<>();
        wrapper.orderByAsc("create_time");
        wrapper.eq("grade",grade);
        List<Sclass> sclassList = sclassService.list(wrapper);
        return sclassList;
    }

    @ApiOperation(value = "添加时确认参数")
    @GetMapping("addCheckParams")
    @ResponseBody
    public boolean  addCheckParams(String param, String value,String grade) {
        boolean result = sclassService.addCheckParams(param,value,grade);
        return result;
    }

    @ApiOperation(value = "编辑时确认参数")
    @GetMapping("editCheckParams")
    @ResponseBody
    public boolean  editCheckParams(String param, String value,String id,String grade) {
        boolean result = sclassService.editCheckParams(param,value,id,grade);
        return result;
    }
}

