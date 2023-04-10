package com.lc.courseonline.commons.utils;

import lombok.Data;

import java.util.Map;

@Data
public class WangEditorFileData {
    private Integer errno;
    private Map<String,Object> data;
    private String message;

    public Integer getErrno() {
        return errno;
    }

    public void setErrno(Integer errno) {
        this.errno = errno;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public WangEditorFileData(Integer errno, Map<String, Object> data, String message) {
        this.errno = errno;
        this.data = data;
        this.message = message;
    }

    public WangEditorFileData() {
    }
}
