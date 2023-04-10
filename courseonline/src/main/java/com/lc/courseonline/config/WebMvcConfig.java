package com.lc.courseonline.config;

import com.lc.courseonline.servicebase.Interceptor.BackLoginInterceptor;
import com.lc.courseonline.servicebase.Interceptor.FrontLoginInterceptor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    //配置项目启动首页
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        //设置templates文件夹目录下的项目首页
        registry.addViewController("/").setViewName("front/index");
    }

    //配置访问拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //后台拦截器
        HandlerInterceptor interceptor = new BackLoginInterceptor();
        String path[] = {"/courseline/**", "/backlink/**"};
        String excludePath[] = {"/courseonline/admin/logout", "/backlink/login", "/backlink/forgetPwd"};
        registry.addInterceptor(interceptor).addPathPatterns(path).excludePathPatterns(excludePath);

        //前台拦截器
        HandlerInterceptor interceptor2 = new FrontLoginInterceptor();
        String path2[] = {"/frontlink/subsection","/frontlink/subsectionDetails","/frontlink/material", "/frontlink/contact","/frontlink/studentInfo","/frontlink/updatePwd"};
        String excludePath2[] = {""};
        registry.addInterceptor(interceptor2).addPathPatterns(path2).excludePathPatterns(excludePath2);
    }


    @Value("${file.staticPatternPath}")
    private String staticPatternPath;
    @Value("${file.uploadFolder}")
    private String uploadFolder;

    //配置静态资源访问路径
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/" + staticPatternPath + "/**").addResourceLocations("file:" + uploadFolder);
    }
}