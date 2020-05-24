package com.tao.MyInterceptor;

import com.tao.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyInterceptor implements HandlerInterceptor {

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HttpSession session = request.getSession();
        //System.out.println("登录拦截111");
        User user = (User) session.getAttribute("user");

        if(user!=null){
            File file = new File("C:\\Users\\胡松涛\\Desktop\\myInterceptor.txt");
            if(!file.exists()){
                file.createNewFile();
            }

            FileOutputStream os = new FileOutputStream(file,true);
            BufferedWriter bw=new BufferedWriter(new OutputStreamWriter(os));
            Date date = new Date();
            String format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date);

            bw.write(("时间:"+format+"---> "+"用户名："+user.getUsername()+"--->进行了登录"));
            bw.newLine();

            bw.flush();
            bw.close();
            os.close();
            //System.out.println("登录拦截222");
        }
    }


}
