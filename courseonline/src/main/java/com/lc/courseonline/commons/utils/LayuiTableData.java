package com.lc.courseonline.commons.utils;

import lombok.Data;

import java.util.List;

@Data
public class LayuiTableData {
    private Integer code;
    private String msg;
    private long count;
    private List data;

    public LayuiTableData() {
    }

    @Override
    public String toString() {
        return "LayuiTableData{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", count=" + count +
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

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }
}
