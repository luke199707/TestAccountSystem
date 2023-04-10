package com.lc.courseonline.servicebase.exceptionhandler;

import com.lc.courseonline.commons.utils.R;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
//错误信息写到文件
public class GlobalExceptionHandler {

    //指定出现什么异常执行
    @ExceptionHandler(Exception.class)
    @ResponseBody
    //返回数据
    public R error(Exception e){
        e.printStackTrace();
        return R.error().message("执行了全局异常处理");
    }

    //特定异常处理
    @ExceptionHandler(ArithmeticException.class)
    @ResponseBody
    //返回数据
    public R error(ArithmeticException e){
        e.printStackTrace();
        return R.error().message("执行了全局异常处理");
    }

    //自定义异常
    @ExceptionHandler(LcException.class)
    @ResponseBody
    //返回数据
    public R error(LcException e){
        e.printStackTrace();
        return R.error().code(e.getCode()).message(e.getMsg());
    }
}
