package com.thinkgem.jeesite.modules.zh.star.utils;

import org.apache.poi.ss.formula.functions.T;

/**
 * @description
 * @author wzp
 * @date 11.21 0021
 */
public class Result {
    /**
     * 是否成功
     */
    private boolean success;

    /**
     * 返回的消息
     */
    private String resultMsg;



    /**
     * 返回值，类型为T

     */
    private T t;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getResultMsg() {
        return resultMsg;
    }

    public void setResultMsg(String resultMsg) {
        this.resultMsg = resultMsg;
    }

    public T getT() {
        return t;
    }

    public void setT(T t) {
        this.t = t;
    }

    @Override
    public boolean equals(Object obj) {
        return super.equals(obj);
    }

    @Override
    public String toString() {
        return super.toString();
    }
}
