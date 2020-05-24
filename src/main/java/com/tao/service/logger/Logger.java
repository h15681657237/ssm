package com.tao.service.logger;

import org.springframework.stereotype.Component;

@Component("logger")
public class Logger {


    public void before(){
        System.out.println("前置方法");
    }

    public void after(){
        System.out.println("后置方法");
    }
}
