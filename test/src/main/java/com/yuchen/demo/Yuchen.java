package com.yuchen.demo;/*
    @author yuchen
    @create -- 
*/

import com.yuchen.bean.NumberEnum;
import sun.nio.cs.ext.GBK;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.*;

public class Yuchen{
    static Map<String,String> map = new HashMap();
    Map<String, String> stringStringMap = Collections.synchronizedMap(map);

    public static void main(String[] args){

    }


    private static List<String> loadTemplateFieldListWithDynamic(String startCell, String endCell) {
        //A1~B2    startCell起始坐标A1  endCell终点左边B2
        List<String> locationList = new ArrayList<>();
        String startCellLocationForSplit = expr2xy(startCell);
        String[] startXAndY = startCellLocationForSplit.split("_");
        int startX = xToNum(startXAndY[0]);
        int startY = Integer.parseInt(startXAndY[1]);

        String endCellLocationForSplit = expr2xy(endCell);
        String[] endXAndY = endCellLocationForSplit.split("_");
        int endX = xToNum(endXAndY[0]);
        int endY = Integer.parseInt(endXAndY[1]);

        for(int j=startX;j<=endX;j++){
            for(int i=startY;i<=endY;i++){
                locationList.add(numToX(j)+i);
            }
        }

        return locationList;
    }

    public static int xToNum(String column) {
        int num = 0;
        int result = 0;
        int length =column.length();
        for(int i = 0; i < length; i++) {
            char ch = column.charAt(length - i - 1);
            num = (int)(ch - 'A' + 1) ;
            num *= Math.pow(26, i);
            result += num;
        }
        return result;
    }

    /**
     * 数字转字母
     * @param ：需要转换成字母的数字
     * @return column:ABCD列名称
     * **/
    public static String numToX(int columnIndex) {
        if (columnIndex <= 0) {
            return null;
        }
        String columnStr = "";
        columnIndex--;
        do {
            if (columnStr.length() > 0) {
                columnIndex--;
            }
            columnStr = ((char) (columnIndex % 26 + (int) 'A')) + columnStr;
            columnIndex = (int) ((columnIndex - columnIndex % 26) / 26);
        } while (columnIndex > 0);
        return columnStr;
    }

    //将A10转换成A_10 AA10->AA_10
    public static String expr2xy(String expr) {
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
}
