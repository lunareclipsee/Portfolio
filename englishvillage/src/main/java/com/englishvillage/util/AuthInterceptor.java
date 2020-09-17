package com.englishvillage.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

    private static final String LOGIN = "login";
    private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
    
    @Override
    public boolean preHandle(HttpServletRequest request, 
    	HttpServletResponse response,
        Object handler) throws Exception {
        
    	System.out.println();
        HttpSession session = request.getSession();
        
        if(session.getAttribute("member") == null) {
        
            logger.info("current user is not logined");
            
            // 로그인하지 않은 사용자일 경우 로그인 페이지로 이동
            response.sendRedirect("/englishvillage/auth/login.do");
            return false;
        }
        
        // 로그인한 사용자일 경우 Controller 호출
        return true;
    }
}