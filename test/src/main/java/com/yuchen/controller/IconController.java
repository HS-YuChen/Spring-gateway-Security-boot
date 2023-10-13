package com.yuchen.controller;/*
    @author yuchen
    @create -- 
*/

import com.alibaba.fastjson.JSON;
import com.yuchen.mapper.IconMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
    public Object insertIconFile(@RequestParam(required = false) String id, String industryId, MultipartFile file, String iconStatus){
        try {
            InputStream inputStream = file.getInputStream();
            int i = iconMapper.insertIconFile(id, industryId, inputStream, iconStatus);
            if(i>0){
                return "插入成功";
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "插入失败";
    }

    @RequestMapping("/getAllIcons")
    public List<Map<String,Object>> getAllIcons(){
        List<Map<String, Object>> all = iconMapper.getAll();
       all = all.stream().map(m->{
           byte[] bytes = (byte[]) m.get("iconByte");
           m.put("iconByte",bytes);
           return m;
        }).collect(Collectors.toList());
        return all;
    }

    @RequestMapping("/testInsert")
    public void testInsert(String id) throws IOException {
        List<Map<String,Object>> mapList = new ArrayList<>();
        Map<String, String> select = iconMapper.select(id + "1");
        Map<String,Object> map = null;
        for(int i=21;i<51;i++){
            map = new HashMap<>();
            String str = select.get("id");
            String device_name = select.get("device_name");
            str = str.substring(0,str.length()-1);
            device_name = device_name.substring(0,device_name.length()-1);
            map.put("id",str+i);
            map.put("product_id",select.get("product_id"));
            map.put("device_name",device_name+i);
            mapList.add(map);
        }
        iconMapper.testInsert(mapList);
    }
}
