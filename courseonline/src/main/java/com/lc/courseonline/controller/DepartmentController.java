package com.lc.courseonline.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lc.courseonline.commons.utils.LayuiTableData;
import com.lc.courseonline.commons.utils.UUIDUtil;
import com.lc.courseonline.entity.Department;
import com.lc.courseonline.service.DepartmentService;
import com.lc.courseonline.service.GradeService;
import com.lc.courseonline.service.SclassService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-08-04
 */
@Api(description = "学院管理")
@RestController
@RequestMapping("/courseonline/department")
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private GradeService gradeService;

    @Autowired
    private SclassService sclassService;

    @ApiOperation(value = "添加")
    @PostMapping("add")
    public ModelAndView add(String name){
        ModelAndView mav = new ModelAndView();
        //封装数据
        Department department = new Department();
        department.setId(UUIDUtil.getUUID());
        department.setName(name);
        //执行Dao
        departmentService.save(department);
        //返回
        mav.setViewName("redirect:/backlink/department");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "删除")
    @GetMapping("deleteById")
    @ResponseBody
    public String deleteById(String id){
        //先删除班级信息
        sclassService.deleteSclassByDepartment(id);
        //再删除年级信息
        gradeService.deleteGradeByDepartmentId(id);
        //最后删除学院信息
        if (departmentService.removeById(id)) {
            return "success";
        }
        return "fail";
    }

    @ApiOperation(value = "修改")
    @PostMapping("edit")
    public ModelAndView edit(String id, String name){
        ModelAndView mav = new ModelAndView();
        //封装数据
        Department department = departmentService.getById(id);
        department.setName(name);
        //执行Dao
        departmentService.updateById(department);
        //返回
        mav.setViewName("redirect:/backlink/department");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "分页条件查询")
    @GetMapping("pageListDepartment")
    public LayuiTableData pageListCourse(long page, long limit, String name, String sortField, String order){
        //创建layui数据表格专用返回对象
        LayuiTableData layuiTableData = new LayuiTableData();
        //封装公告list查询条件
        QueryWrapper<Department> listWrapper = new QueryWrapper<>();
        if (sortField!=null&&!("".equals(sortField))){
            if ("asc".equals(order)){
                listWrapper.orderBy(true,true,sortField);
            }else {
                listWrapper.orderBy(true,false,sortField);
            }
        }else {
            listWrapper.orderByDesc("create_time");
        }
        if (name!=null&&!("".equals(name))){
            listWrapper.like("name",name);
        }
        //分页page对象
        Page<Department> pageCourse = new Page<>(page,limit);
        departmentService.page(pageCourse, listWrapper);
        long total = pageCourse.getTotal();
        List<Department> data = pageCourse.getRecords();
        //返回数据封装
        layuiTableData.setCode(0);
        layuiTableData.setMsg("");
        layuiTableData.setCount(total);
        layuiTableData.setData(data);
        //返回
        return layuiTableData;
    }

    @ApiOperation(value = "获取所有")
    @GetMapping("getAll")
    @ResponseBody
    public List<Department> getAll() {
        QueryWrapper<Department> wrapper = new QueryWrapper<>();
        wrapper.orderByAsc("create_time");
        List<Department> departmentList = departmentService.list(wrapper);
        return departmentList;
    }

    @ApiOperation(value = "通过名称获取id")
    @GetMapping("getIdByName")
    @ResponseBody
    public String getIdByName(String name) {
        QueryWrapper<Department> wrapper = new QueryWrapper<>();
        wrapper.eq("name",name);
        Department one = departmentService.getOne(wrapper);
        return one.getId();
    }

    @ApiOperation(value = "添加时确认参数")
    @GetMapping("addCheckParams")
    @ResponseBody
    public boolean  addCheckParams(String param, String value) {
        boolean result = departmentService.addCheckParams(param,value);
        return result;
    }

    @ApiOperation(value = "编辑时确认参数")
    @GetMapping("editCheckParams")
    @ResponseBody
    public boolean  editCheckParams(String param, String value,String id) {
        boolean result = departmentService.editCheckParams(param,value,id);
        return result;
    }
}

