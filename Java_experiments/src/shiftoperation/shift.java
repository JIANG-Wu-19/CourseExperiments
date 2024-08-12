package shiftoperation;

import java.util.Scanner;
import java.util.*;
import java.util.regex.Pattern;

public class shift {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("请输入进行移位操作的数字");
        String num= sc.next();
//下列注释代码是判断是否为一个数字，自写判断数的方法存在问题
//        Pattern pat=Pattern.compile("[0-9]*");
//        if(pat.matcher(num).matches())
//            myShift(Long.parseLong(num),true,1);
//        else
//            System.out.println("输入的不是数字");
        if(isNum(num))
            System.out.println(myShift(Long.parseLong(num), true, 1));
        else
            System.out.println("输入错误");
    }

    public static <T extends Number> long myShift(T num,boolean dir,int bitNum){
        long r=num.longValue();
        if(dir)
            return r>>bitNum;
        else
            return r<<bitNum;
    }

    public static boolean isNum(String num)
    {
        for (int i = 0; i < num.length(); i++) {
            int j=num.charAt(i)-'0';
            if(j>9|j<0)
            {
                return false;
            }
        }
        return true;
    }
}
