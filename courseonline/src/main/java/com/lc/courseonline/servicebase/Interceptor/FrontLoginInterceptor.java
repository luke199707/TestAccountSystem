package com.lc.courseonline.servicebase.Interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FrontLoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("loggingStudent") != null) {
            // 已登录，放行。。
            return true;
        } else {
            // 未登录，拦截 返回login
            request.setAttribute("interceptorMsg","没有权限,请先登录");
            request.getRequestDispatcher("/frontlink/login").forward(request,response);
            return false;
        }
    }
}
