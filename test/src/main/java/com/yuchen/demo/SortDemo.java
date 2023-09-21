package com.yuchen.demo;

public class SortDemo {

    public static void main(String[] args) {
        int sw = 3;
        switch (sw){
            //二分查找
            case 0:
                int[] binarySearch = {24, 33, 45, 56, 58, 62, 74, 89, 102};
                System.out.println(binarySearch(binarySearch,89));
                break;
            //冒泡排序
            case 1:
                int[] bubbleSort = {9,18,2,45,32,47,57,42,56};
                bubbleSort = bubbleSort(bubbleSort);
                for (int i = 0; i < bubbleSort.length; i++) {
                    System.out.println(bubbleSort[i]);
                }
                break;
            case 2:
                int[] selectionSort = {9,18,2,45,32,47,57,42,56};
                selectionSort = selectionSort(selectionSort);
                for (int i = 0; i < selectionSort.length; i++) {
                    System.out.println(selectionSort[i]);
                }
                break;
            case 3:
                int[] insertionSort = {9,18,2,45,32,47,57,42,56};
                insertionSort = insertionSort(insertionSort);
                for (int i = 0; i < insertionSort.length; i++) {
                    System.out.println(insertionSort[i]);
                }
                break;
        }
    }

    /*二分查找法
    * 使用场景
    * 1、数组
    * 2、有序数据
    * 3、数据量大，数据量不大的话可以直接遍历
    * * * * * * * * * * */
    public static int binarySearch(int nums[],int target){
        int left = 0;
        int right = nums.length-1;
        while(left<=right){
            int mid = left+right >>> 1;
            if(target>nums[mid]){
                left = mid + 1;
            }else if(target<nums[mid]){
                right = mid - 1;
            }else{
                return mid;
            }
        }
        return -1;
    }

    /*冒泡排序
    *
    * 每一轮冒泡都将最大的元素排到最后一位
    * 重复冒泡直到数据有序
    * * * * * * * * * * * * * * * * */
    public static int[] bubbleSort(int[] nums){
        int num = 0;
        boolean b = true;
        for(int i=0;i<nums.length;i++){
            for(int j=i+1;j<nums.length;j++){
                if(nums[i]>nums[j]){
                    num = nums[i];
                    nums[i] = nums[j];
                    nums[j] = num;
                    b = false;
                }
            }
            if(b){
                break;
            }
        }
        return nums;
    }

    /*选择排序
    *
    * 第一轮选择最小的元素放在初始位
    * 第二轮选择最小的元素放在第二位
    * 重复直到有序
    * * */
    public static int[] selectionSort(int[] nums){
        for (int i = 0; i < nums.length; i++) {
            int min = i;
            for (int j = i+1; j < nums.length; j++) {
                if(nums[j]<nums[min]){
                    min = j;
                }
            }
            if(i!=min){
                int t = nums[i];
                nums[i] = nums[min];
                nums[min] = t;
            }
        }
        return nums;
    }

    /*插入排序
    * 将第一位元素当作有序序列
    *
    * * * * * * * */
    public static int[] insertionSort(int[] nums){
        for (int i = 1; i < nums.length; i++) {
            int tem = nums[i];
            int j = i;
            while (j>0 && tem < nums[j-1]){
                nums[j] = nums[j-1];
                j--;
            }
            if(i!=j){
                nums[j] = tem;
            }
        }
        return nums;
    }

}
