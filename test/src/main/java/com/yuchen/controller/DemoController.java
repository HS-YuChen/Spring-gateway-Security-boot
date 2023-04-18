package com.yuchen.controller;/*
    @author yuchen
    @create -- 
*/

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.yuchen.bean.DemoBean;
import com.yuchen.bean.NumberEnum;
import org.apache.poi.ss.util.CellAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/test")
public class DemoController{
    private static final long serialVersionUID = -495513345685932591L;

    public static void main(String[] args) {
        sort();
    }
    @RequestMapping("/sort")
    public static String sort(){
        List<DemoBean> list = new ArrayList<>();
        DemoBean K = new DemoBean("K",7);
        DemoBean AK = new DemoBean("JK",7);
        DemoBean AA = new DemoBean("IA",7);
        DemoBean C = new DemoBean("A",7);

        list.add(K);
        list.add(AA);
        list.add(C);
        list.add(AK);

        List<DemoBean> collect = list.stream().sorted(Comparator.comparing(DemoBean::getRight).thenComparing(DemoBean::getLeft)).collect(Collectors.toList());
        for (int i=0;i<collect.size();i++){
            DemoBean demoBean = collect.get(i);
            System.out.println(demoBean.getLeft()+demoBean.getRight());
        }
        return "yuchen";
    }



    @PostMapping("/poiTest")
    public String poiTest(MultipartFile file,String json) throws IOException {
        JSONObject jsonObject = JSONObject.parseObject(json);
        JSONArray cellArray = jsonObject.getJSONArray("cell");
        File excelFile = fillExcel(file, cellArray);
        return "";
    }

    private File fillExcel(MultipartFile file, JSONArray cellArray) throws IOException {
        //创建临时文件
        String prefix = file.getOriginalFilename();
        String name = file.getName();
        prefix = prefix.substring(prefix.lastIndexOf("."));
        File excelFile = File.createTempFile(name, prefix);

        Map<String,String> map = new HashMap<>();
        for(int i=0;i<cellArray.size();i++){
            JSONObject jsonObject = cellArray.getJSONObject(i);
            String location = jsonObject.getString("location");
            String fieldName = jsonObject.getString("fieldName");
            //A1->A_1
            String xAndY = expr2xy(location);
            String[] xy = xAndY.split("_");
            //坐标转换需要减去一
            int x = xToNum(xy[0])-1;
            int y = Integer.valueOf(xy[1]) - 1;
            map.put(x+":"+y,fieldName);
        }

        XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());
        XSSFSheet sheet = workbook.getSheetAt(0);
        for(int i=0;i<sheet.getLastRowNum()-1;i++){
            XSSFRow xssRow = sheet.getRow(i);
            for(int j=0;j<xssRow.getPhysicalNumberOfCells()-1;j++){
                XSSFCell cell = xssRow.getCell(j);
                CellAddress address = cell.getAddress();
                int column = address.getColumn();
                int row = address.getRow();
                String location = column + ":" + row;
                if(map.containsKey(location)){
                    cell.setCellValue(map.get(location));
                }
            }
        }
        OutputStream otStream = new FileOutputStream(excelFile);
        workbook.write(otStream);
        otStream.close();
        return excelFile;
    }

    //将A10转换成A_10 AA10->AA_10
    public String expr2xy(String expr) {
        String x = "";
        String y = "";
        char[] chars = expr.toCharArray();
        for (int i = 0; i < chars.length; i++) {
            Integer integer = NumberEnum.str2int(String.valueOf(chars[i]));
            if (integer >= 0 && integer <= 9) {
                y += chars[i];
            } else {
                x += chars[i];
            }
        }
        return x + "_" + y;
    }

    //将Excel的横坐标A转换1 AA->27
    public int xToNum(String column) {
        int num = 0;
        int result = 0;
        int length = column.length();
        for (int i = 0; i < length; i++) {
            char ch = column.charAt(length - i - 1);
            num = (int) (ch - 'A' + 1);
            num *= Math.pow(26, i);
            result += num;
        }
        return result;
    }
}
