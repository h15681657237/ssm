package com.tao.util;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class Msg implements Serializable {

    private int code;

    private String msg;

    private Map<String,Object> info=new HashMap<>();

    public static Msg success(){
       Msg msg=new Msg();
       msg.setCode(1);
       msg.setMsg("成功");
       return msg;
    }

    public static Msg fail(){
        Msg msg=new Msg();
        msg.setCode(0);
        msg.setMsg("失败");
        return msg;
    }

    public Msg addInfo(String key,Object value){
        this.info.put(key,value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getInfo() {
        return info;
    }

    public void setInfo(Map<String, Object> info) {
        this.info = info;
    }
}
