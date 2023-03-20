package com.yuchen.demo;

public class SortDemo {

    public static int[] bubbleSort(int[] array){
        int tem = 0;
        for (int i=0;i<array.length;i++){
            boolean ifTrue = true;
            for(int j=0;j<array.length-1;j++){
                if(array[j]>array[j+1]){
                    tem = array[j];
                    array[j] = array[j+1];
                    array[j+1] = tem;

                    ifTrue = false;
                }
            }
            if(ifTrue){
                break;
            }
        }
        return array;
    }

    public static int[] selctionSort(int[] array){
        int min = 0;
        int tem = 0;
        for (int i=0;i<array.length-1;i++){
            min = i;
            for(int j=i+1;j<array.length;j++){
                if(array[min]>array[j]){
                    min = j;
                }
            }
            if(i!=min){
                tem = array[i];
                array[i] = array[min];
                array[min] = tem;
            }
        }
        return array;
    }

    public static int[] insertionSort(int[] array){
        int min = 0;
        for (int i=0;i<array.length;i++){
            for(int j=i+1;j<array.length;j++){

            }
        }
        return array;
    }

    public static void main(String[] args) {
        int[] ins = {17,26,15,44,53,2,1,15,29,10,0};

//        int[] array = bubbleSort(ins);
        int[] array = selctionSort(ins);
//        int[] array = insertionSort(ins);
        for (int i=0;i<array.length;i++){
            System.out.println(array[i]);
        }
    }
}
