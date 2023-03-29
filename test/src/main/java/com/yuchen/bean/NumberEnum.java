package com.yuchen.bean;/*
    @author yuchen
    @create -- 
*/

public enum NumberEnum {
    zero(0,"0"),
    one(1,"1"),
    two(2,"2"),
    three(3,"3"),
    four(4,"4"),
    five(5,"5"),
    six(6,"6"),
    seven(7,"7"),
    eight(8,"8"),
    nine(9,"9");

    private Integer number;
    private String numStr;

    NumberEnum(Integer number, String numStr) {
        this.number = number;
        this.numStr = numStr;
    }

    public static Integer str2int(String str){
        Integer result = -1;
        for(NumberEnum number:NumberEnum.values()){
            if(str !=null){
                if(str.equals(number.numStr)){
                    result = number.number;
                }
            }
        }
        if(result == -1){
            char c = str.charAt(0);
            result = Integer.valueOf(c);
        }
        return result;
    }
}
