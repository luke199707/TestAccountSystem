package com.lc.courseonline.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lc.courseonline.commons.utils.FileUtil;
import com.lc.courseonline.commons.utils.LayuiFileData;
import com.lc.courseonline.commons.utils.LayuiTableData;
import com.lc.courseonline.commons.utils.UUIDUtil;
import com.lc.courseonline.entity.FrontDataPage;
import com.lc.courseonline.entity.Material;
import com.lc.courseonline.service.MaterialService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;
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
 * @since 2022-07-15
 */
@Api(description = "资料管理")
@RestController
@RequestMapping("/courseonline/material")
public class MaterialController {
    @Autowired
    private MaterialService materialService;

    @Autowired
    private FileUtil fileUtil;

    @ApiOperation(value = "资料添加")
    @PostMapping("add")
    public ModelAndView add(Material m) {
        ModelAndView mav = new ModelAndView();
        //封装数据
        Material material = new Material();
        if (m != null) {
            material.setId(UUIDUtil.getUUID());
            material.setName(m.getName());
            material.setUrl(m.getUrl());
            material.setRealpath(m.getRealpath());
            material.setSuffix(m.getSuffix());
            material.setFilename(m.getFilename());
        }
        //执行dao
        materialService.save(material);
        //返回
        mav.setViewName("redirect:/backlink/material");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "资料文件上传")
    @PostMapping("uploadMaterial")
    public LayuiFileData uploadMaterial(MultipartFile file, @RequestParam(required = false,defaultValue = "default") String dir){
        LayuiFileData layuiFileData = new LayuiFileData();
        //文件上传
        if (!file.isEmpty()){
            Map<String, Object> fileInfoMap = fileUtil.upload(file,dir);//dir为文件存放目录
            if (fileInfoMap.get("url")!=null){
                layuiFileData.setCode(0);
                layuiFileData.setMsg("文件上传成功");
                HashMap<String, String> map = new HashMap<>();
                map.put("url", (String) fileInfoMap.get("url"));
                map.put("suffix", (String) fileInfoMap.get("suffix"));
                map.put("realpath", (String) fileInfoMap.get("realpath"));
                map.put("filename", (String) fileInfoMap.get("filename"));
                layuiFileData.setData(map);
            }else {
                layuiFileData.setCode(1);
                layuiFileData.setMsg("文件上传失败");
            }
        }else {
            layuiFileData.setCode(1);
            layuiFileData.setMsg("文件上传失败");
        }
        //返回
        return layuiFileData;
    }

    @ApiOperation(value = "资料删除")
    @GetMapping("deleteById")
    @ResponseBody
    public String deleteById(String id) {
        if (!id.isEmpty() && id != null) {
            Material material = materialService.getById(id);
            //删除课件文件
            fileUtil.delete(material.getRealpath());
            //删除数据库信息
            if (materialService.removeById(id)) {
                return "success";
            }
        }
        return "fail";
    }

    @ApiOperation(value = "资料分页条件查询")
    @GetMapping("pageListMaterial")
    public LayuiTableData pageListMaterial(long page, long limit, String name, String sortField, String order) {
        //创建layui数据表格专用返回对象
        LayuiTableData layuiTableData = new LayuiTableData();
        //封装list查询条件
        QueryWrapper<Material> listWrapper = new QueryWrapper<>();
        if (sortField != null && !("".equals(sortField))) {
            if ("asc".equals(order)) {
                listWrapper.orderBy(true, true, sortField);
            } else {
                listWrapper.orderBy(true, false, sortField);
            }
        } else {
            listWrapper.orderByDesc("create_time");
        }
        if (name != null && !("".equals(name))) {
            listWrapper.like("name", name);
        }
        //分页page对象
        Page<Material> pageNotice = new Page<>(page, limit);
        materialService.page(pageNotice, listWrapper);
        long total = pageNotice.getTotal();
        List<Material> data = pageNotice.getRecords();
        //返回数据封装
        layuiTableData.setCode(0);
        layuiTableData.setMsg("");
        layuiTableData.setCount(total);
        layuiTableData.setData(data);
        //返回
        return layuiTableData;
    }

    @ApiOperation(value = "确认参数")
    @GetMapping("checkParams")
    @ResponseBody
    public boolean checkParams(String param, String value) {
        boolean result = materialService.checkParams(param, value);
        return result;
    }

    //---------------------------------------------------前台使用---------------------------------------------------

    @ApiOperation(value = "前台分页条件查询课件资料")
    @GetMapping("getFrontPageMaterial")
    @ResponseBody
    public Map<String,Object> getFrontPageMaterial(FrontDataPage frontDataPage){
        frontDataPage.setLimit(9);//配合前台数据显示条目
        QueryWrapper<Material> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("create_time");
        // 分页page对象
        Page<Material> pageNotice = new Page<>(frontDataPage.getCurrent(),frontDataPage.getLimit());
        materialService.page(pageNotice, wrapper);
        long total = pageNotice.getTotal();
        List<Material> materialList = pageNotice.getRecords();
        // 前台分页对象
        frontDataPage.setRows(total);
        frontDataPage.setPath("/frontlink/material");

        HashMap<String, Object> map = new HashMap<>();
        map.put("frontDataPage",frontDataPage);
        map.put("materialList",materialList);
        return map;
    }
}

