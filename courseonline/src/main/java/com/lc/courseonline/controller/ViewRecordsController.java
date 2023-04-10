package com.lc.courseonline.controller;


import com.lc.courseonline.commons.utils.LayuiTableData;
import com.lc.courseonline.commons.utils.UUIDUtil;
import com.lc.courseonline.entity.Student;
import com.lc.courseonline.entity.ViewRecords;
import com.lc.courseonline.service.StudentService;
import com.lc.courseonline.service.ViewRecordsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author zhangjunhui
 * @since 2022-07-21
 */
@Api(description = "观看记录查询")
@RestController
@RequestMapping("/courseonline/viewRecords")
public class ViewRecordsController {

    @Autowired
    private ViewRecordsService viewRecordsService;

    @Autowired
    private StudentService studentService;

    /*@ApiOperation(value = "观看记录添加")
    @PostMapping("add")
    public ModelAndView add(ViewRecords vr){
        ModelAndView mav = new ModelAndView();
        //封装数据
        ViewRecords viewRecords = new ViewRecords();
        viewRecords.setId(UUIDUtil.getUUID());
        viewRecords.setStuid(vr.getStuid());
        viewRecords.setCourseid(vr.getCourseid());
        viewRecords.setChapterid(vr.getChapterid());
        viewRecords.setSubsectionid(vr.getSubsectionid());
        //执行Dao
        viewRecordsService.save(viewRecords);
        //返回
        mav.setViewName("redirect:/backlink/viewRecords");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }*/

    @ApiOperation(value = "观看记录删除")
    @GetMapping("deleteById")
    @ResponseBody
    public String deleteById(String id) {
        if (viewRecordsService.removeById(id)) {
            return "success";
        }
        return "fail";
    }

    @ApiOperation(value = "观看记录修改")
    @PostMapping("edit")
    public ModelAndView edit(ViewRecords vr) {
        ModelAndView mav = new ModelAndView();
        //封装数据
        ViewRecords viewRecords = viewRecordsService.getById(vr.getId());
        viewRecords.setStuid(vr.getStuid());
        viewRecords.setCourseid(vr.getCourseid());
        viewRecords.setChapterid(vr.getChapterid());
        viewRecords.setSubsectionid(vr.getSubsectionid());
        //执行Dao
        viewRecordsService.updateById(viewRecords);
        //返回
        mav.setViewName("redirect:/backlink/viewRecords");//重定向到跳转BackLinkController，避免页面刷新表单重复提交
        return mav;
    }

    @ApiOperation(value = "观看记录分页条件查询")
    @GetMapping("pageListConditionViewRecords")
    public LayuiTableData pageListConditionViewRecords(long page, long limit,String sno, String stuName, String courseid, String chapterid, String subsectionid,
                                                       @RequestParam(required = false, defaultValue = "create_time") String sortField,
                                                       @RequestParam(required = false, defaultValue = "desc") String order) {
        //创建layui数据表格专用返回对象
        LayuiTableData layuiTableData = new LayuiTableData();
        //通过学生姓名获取StudentList(可能重名)
        List<Student> studentList = studentService.getByStuName(stuName);
        List stuIdList = new ArrayList();
        for (int i = 0; i < studentList.size(); i++) {
            String id = studentList.get(i).getId();
            stuIdList.add(id);
        }
        if (stuIdList.size()<=0 &&stuName!=null&&!("".equals(stuName))) {
            stuIdList.add("empty list");//防止因stuIdList列表为空，不触发姓名查询条件
        }
        //封装list查询条件
        Map<String, Object> map = new HashMap<>();
        map.put("stuIdList", stuIdList);
        map.put("sno", sno);
        map.put("courseid", courseid);
        map.put("chapterid", chapterid);
        map.put("subsectionid", subsectionid);
        map.put("sortField", sortField);
        map.put("order", order);
        //        map.put("page", (page - 1) * limit);//使用offset关键字分页时使用
        map.put("page", page);
        map.put("limit", limit);
        List<ViewRecords> data = viewRecordsService.queryViewRecordsByConditionForPage(map);
        int total = viewRecordsService.queryCountOfViewRecordsByCondition(map);
        //返回数据封装
        layuiTableData.setCode(0);
        layuiTableData.setMsg("");
        layuiTableData.setCount(total);
        layuiTableData.setData(data);
        //返回
        return layuiTableData;
    }

    //---------------------------------------------------前台使用---------------------------------------------------
    @ApiOperation(value = "观看记录添加")
    @PostMapping("add")
    public void add(ViewRecords vr, HttpSession session) {
        Student loggingStudent = (Student) session.getAttribute("loggingStudent");
        // 若用户已经登录，则添加观看记录
        if (loggingStudent != null) {
            // 若该用户的此视频观看记录不存在，则添加
            if (viewRecordsService.getByStuIdSubsectionId(loggingStudent.getId(), vr.getSubsectionid())) {
                //封装数据
                ViewRecords viewRecords = new ViewRecords();
                viewRecords.setId(UUIDUtil.getUUID());
                viewRecords.setSno(loggingStudent.getSno());
                viewRecords.setStuid(loggingStudent.getId());
                viewRecords.setCourseid(vr.getCourseid());
                viewRecords.setChapterid(vr.getChapterid());
                viewRecords.setSubsectionid(vr.getSubsectionid());
                //执行Dao
                viewRecordsService.save(viewRecords);
            }
        }
    }
}

