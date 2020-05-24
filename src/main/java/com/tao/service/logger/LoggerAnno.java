package com.tao.service.logger;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
public class LoggerAnno {

    @Pointcut("execution(* com.tao.service.*.*.*(..))")
    public void pt1(){}

    @Before("pt1()")
    public void before(){
        System.out.println("前置方法");
    }

    @After("pt1")
    public void after(){
        System.out.println("后置方法");
    }

}
