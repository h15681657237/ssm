package com.tao.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tao.domain.User;
import com.tao.service.userService.UserSservice;
import com.tao.util.Msg;
import javafx.scene.control.Alert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user/")
public class UserController {

    @Autowired
    UserSservice userSservice;


    @RequestMapping("findAll")
    public String findAll(@RequestParam(value = "pageNum",defaultValue = "1",required = false) int pageNum,
                          Map<String,Object> map){
        PageHelper.startPage(pageNum,8);
        List<User> list = userSservice.findAll();
        PageInfo<User> pageInfo=new PageInfo<>(list,6);
        map.put("pageInfo",pageInfo);
        map.put("name","张三");
        return "findAll";
    }

    @RequestMapping("error")
    public void error(){
        int i=1/0;
    }

    @RequestMapping("findById")
    public ModelAndView findById(Integer id){
        ModelAndView mv=new ModelAndView("findById");
        User user = userSservice.findById(id);
        mv.addObject("user",user);
        return mv;
    }
    @RequestMapping("findById_ajax")
    @ResponseBody
    public User findById_ajax(@RequestParam("id") Integer id){
        System.out.println("findById_ajax执行");
        User user = userSservice.findById(id);
        return user;
    }

    @RequestMapping("deleteById")
    @ResponseBody
    public Msg deleteById(@RequestParam(value = "id",required = true) Integer id){
        System.out.println("deleteById");
        System.out.println(id);
        Integer i = userSservice.deleteById(id);
        if(i!=0){
            return Msg.success().addInfo("msg","删除成功！");
        }
        else {
            return Msg.fail().addInfo("msg","删除失败！");
        }
        /*User user=new User();
        user.setUsername("小明");*/
        //return Msg.success().addInfo("msg","删除成功!");

    }

    @RequestMapping(value = "date"/*,produces = "text/html;charset=utf-8"*/)
    @ResponseBody
    public void date(Date birthday, HttpServletResponse res) throws IOException {
        System.out.println(birthday);
        /*Date date = new Date(1234567890);
        return date;*/
        //res.getWriter().print("aaaaa");
        //return "你好";
        res.getWriter().print("你好");
    }

    @RequestMapping("updateUser")
    @ResponseBody
    public Msg updateUser(User user){
        Integer integer = userSservice.updateById(user);
        if(integer==1){
            return Msg.success().addInfo("msg","修改成功！");
        }
        else {
            return Msg.fail().addInfo("msg","修改失败！");
        }
    }

    @RequestMapping("findByName")
    @ResponseBody
    public Msg findByName(@RequestParam("username")String username){
        Integer id = userSservice.findByName(username);
        //注册的用户名不存在，可用
        if(id==null){
            return Msg.success();
        }
        else
            return Msg.fail();
    }

    @RequestMapping("insertUser")
    @ResponseBody
    public Msg insertUser(User user,HttpServletResponse res){
        Integer id = userSservice.insertUser(user);
        System.out.println("insertUser执行");
        if(id==1){
            return Msg.success();
        }else{
            return Msg.fail();
        }

    }

    //在用过滤器做登录拦截时，进行登录和注册时验证所用的ajax请求也会被过滤器拦截
    @RequestMapping("register_findByName")
    @ResponseBody
    public void register_findByName(HttpServletRequest req,HttpServletResponse res){
        try {
            req.getRequestDispatcher("/user/findByName").forward(req,res);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("register_insertUser")
    @ResponseBody
    public void register_insertUser(HttpServletRequest req,HttpServletResponse res){
        try {
            req.getRequestDispatcher("/user/insertUser").forward(req,res);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
