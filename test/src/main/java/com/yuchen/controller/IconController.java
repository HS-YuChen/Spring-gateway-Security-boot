package com.yuchen.controller;/*
    @author yuchen
    @create -- 
*/

import com.alibaba.fastjson.JSON;
import com.yuchen.mapper.IconMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/icon")
public class IconController {
    @Autowired
    private IconMapper iconMapper;
    @RequestMapping("/upIcon")
    public void upIcon(MultipartFile multipartFile,int iconStatus,int industryId,HttpServletRequest request, HttpServletResponse response) throws Exception{
        InputStream in = multipartFile.getInputStream();
        iconMapper.insertIcon(in,iconStatus,industryId);
    }

    @RequestMapping("/downIcon")
    public byte[] downIcon(String id) throws Exception {
        Object iconStream = iconMapper.getIconStream(id);
        String path = "E:\\桌面\\yuchen.jpg";
        File file = new File(path);
        OutputStream out = new FileOutputStream(file);
        out.write((byte[])iconStream);
        out.flush();
        out.close();
        return (byte[])iconStream;
    }

    @RequestMapping("/insertIcon")
    public Object insertIcon(){
        List<Map<String,Object>> insertList = new ArrayList<>();
        Map<String,Object> insertMap = null;
        for(int i =43;i<279;i++){
            for(int j=0;j<6;j++){
                insertMap= new HashMap<>();
                if(j==5){
                    insertMap.put("iconType",1);
                    insertMap.put("industryId",i);
                }else {
                    insertMap.put("industryId",i);
                    insertMap.put("iconStatus",j);
                    insertMap.put("iconType",0);
                }
                insertList.add(insertMap);
            }
        }
        iconMapper.insertIcons(insertList);
        return JSON.toJSON(insertList);
    }

    @RequestMapping("/insertIconFile")
    public Object insertIconFile(String id,MultipartFile file,String iconStatus){

        return null;
    }

}
