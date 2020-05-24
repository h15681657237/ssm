package com.tao.controller;

import com.tao.util.VerifyCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/util/")
public class utilController {

    @RequestMapping("verifycode")
    @ResponseBody
    public void verifycode(HttpServletRequest request, HttpServletResponse response) {

        //System.out.println("verifycode方法执行");
        try {
            VerifyCode.verify(request,response);
            //System.out.println(request.getSession().getAttribute("verifycode"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("getcode")
    @ResponseBody
    public String getcode(HttpServletRequest request){
        String verifycode = (String) request.getSession().getAttribute("verifycode");
        System.out.println(verifycode);
        return verifycode;
    }
}
