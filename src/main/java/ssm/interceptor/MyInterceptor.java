package ssm.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import ssm.pojo.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        String url=httpServletRequest.getRequestURI();
        /*不拦截首页*/
        if(url.indexOf("YourAnswer/")==url.length()-11){
            return true;
        }
        /*不拦截登陆页面*/
        if(url.indexOf("/login")>=0){
            return true;
        }
        /*不拦截管理员*//*
        if(url.indexOf("/manage")>=0){
            return true;
        }*/
        /*验证码不拦截*/
        if(url.indexOf("/captcha")>=0){
            return true;
        }

        HttpSession session=httpServletRequest.getSession();
        User user= (User) session.getAttribute("currentUser");
        if(user!=null){
            return true;
        }
        httpServletRequest.getRequestDispatcher("login").forward(httpServletRequest,httpServletResponse);


        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
