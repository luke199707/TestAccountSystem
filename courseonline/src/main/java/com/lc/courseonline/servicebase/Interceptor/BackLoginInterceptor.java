package com.lc.courseonline.servicebase.Interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BackLoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("loggingUser") != null) {
            // 已登录，放行。。
            return true;
        } else {
            // 未登录，拦截 返回login
            response.sendRedirect("/backlink/login");
            return false;
        }
    }
}
