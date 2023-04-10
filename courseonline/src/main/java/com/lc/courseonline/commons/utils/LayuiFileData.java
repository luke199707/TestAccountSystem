package com.lc.courseonline.commons.utils;

import lombok.Data;

import java.util.Map;

@Data
public class LayuiFileData {
    private Integer code;
    private String msg;
    private Map<String,String> data;

    @Override
    public String toString() {
        return "LayuiFileData{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, String> getData() {
        return data;
    }

    public void setData(Map<String, String> data) {
        this.data = data;
    }

    public LayuiFileData() {
    }
}
