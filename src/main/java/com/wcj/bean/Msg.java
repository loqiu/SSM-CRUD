package com.wcj.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用信息包装类
 * @author loqiu
 * @date 2020-03-17-9:58
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Msg {
    /**
     * 状态码
     * 自定义100 success 200 failed
     */
    private int code;
    /**
     * 用户提示信息
     */
    private String msg;
    /**
     *
     */
    private Map<String,Object> extend = new HashMap<>();

    public static Msg success(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("成功");
        return result;
    }
    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("失败");
        return result;
    }
    public Msg add(String key,Object value){
        this.getExtend().put(key, value);
        return this;
    }

}
