package com.lc.courseonline.commons.utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component
public class FileUtil {

    @Value("${file.serverPath}")
    private String serverPath;
    @Value("${file.staticPatternPath}")
    private String staticPatternPath;
    @Value("${file.uploadFolder}")
    private String uploadFolder;

    //文件上传
    public Map<String,Object> upload(MultipartFile uploadFile, String dir){
        //获取上传文件名称
        String originalFilename = uploadFile.getOriginalFilename();
        //创建在服务器存储的名称
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        String fileName = UUIDUtil.getUUID()+suffix;
        //创建日期目录
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String datePath = sdf.format(new Date());
        File targetPath = new File(uploadFolder+dir,datePath);
        if (!targetPath.exists()){
            targetPath.mkdirs();
        }
        //创建一个文件实例对象
        File file = new File(targetPath,fileName);
        //上传操作
        try {
            uploadFile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //返回
        HashMap<String, Object> map = new HashMap<>();
        map.put("url",serverPath+"/"+staticPatternPath+"/"+dir+"/"+datePath+"/"+fileName);
        map.put("suffix",suffix);
        map.put("realpath",targetPath.getAbsolutePath()+"\\"+fileName);
        map.put("filename",fileName);
        return map;
    }

    //文件删除
    public boolean delete(String realPath){
        File file = new File(realPath);
        if (file.exists()){//文件是否存在
            file.delete();//删除文件
            return true;
        }
        return false;
    }
}
