package com.tao.controller;

import com.tao.domain.User;
import com.tao.service.userService.UserSservice;
import com.tao.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class loginController {

    @Autowired
    UserSservice userSservice;

    @RequestMapping("/login")
    @ResponseBody
    public Msg login(@RequestParam("username") String username, @RequestParam("password") String password,
                     HttpServletRequest req) {
        HttpSession session = req.getSession();
        //清除登录状态
        if(session.getAttribute("user")!=null){
            session.removeAttribute("user");
        }
        Integer byName = userSservice.findByName(username);
        //用户名是否存在
        if (byName >=0) {//存在
            User login = userSservice.login(username);
            if (password.equals(login.getPassword())) {//密码正确
                session.setAttribute("user", login);
                return Msg.success().addInfo("url", "/pages/main.jsp");
            } else {//密码错误
                return Msg.fail().addInfo("msg", "密码错误！");
            }
        } else {
            return Msg.fail().addInfo("msg", "用户名不存在！");
        }
        //return null;
    }

    @RequestMapping("logout")
    public String logout(HttpServletRequest res) {
        HttpSession session = res.getSession();
        if(session.getAttribute("user")!=null){
            session.removeAttribute("user");
        }
        return "redirect:/pages/login.jsp";
    }
}
