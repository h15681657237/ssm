package com.tao.util;

import com.tao.domain.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebFilter("/*")
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //chain.doFilter(req, resp);
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        StringBuffer url = request.getRequestURL();
        List<String> urls = new ArrayList<>();
        urls.add("login");
        urls.add("register");
        urls.add(".css");
        urls.add(".js");
        urls.add(".jpg");
        urls.add("glyphicon");
        urls.add("/util/verifycode");
        urls.add("/util/getcode");
        urls.add("favicon.ico");

        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");
        if (user != null) {
            chain.doFilter(request, response);
            return;
        } else {

            for (String ur : urls) {
                //放行的访问路径
                if (url.indexOf(ur) != -1) {
                    chain.doFilter(request, response);
                    return;
                }

            }

            File file = new File("C:\\Users\\胡松涛\\Desktop\\myInterceptor.txt");
            if(!file.exists()){
                file.createNewFile();
            }

            FileOutputStream os = new FileOutputStream(file,true);
            BufferedWriter bw=new BufferedWriter(new OutputStreamWriter(os));
            Date date = new Date();
            String format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date);

            bw.write(url+"-->被拦截");
            bw.newLine();

            bw.flush();
            bw.close();
            os.close();

            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return;
        }





    }

    public void init(FilterConfig config) throws ServletException {

    }

}
