package toNumber;

import java.util.Scanner;

public class toNumber {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        char[] MS={'7','2','3','.','4','5','6','\0'};
        char[] MS2={'1','2','3','.','6','5','6','\0'};
        System.out.println(MS.length);
        System.out.println(toNumber(MS));
        System.out.println(toNumber(MS2));

        System.out.println("请输入数字：");
        String s=sc.next();
        System.out.println(tonumber(s.toCharArray()));

    }

    public static double toNumber(char[] MS){
        double r1=0,r2=0;
        int ch;


        for(int i=0;MS[i]!='.';i++)
        {
            ch=MS[i]-'0';
            r1=r1*10+ch;
        }

        for(int j= MS.length-2;MS[j]!='.';j--){
            ch=MS[j]-'0';
            r2=(r2+ch)*0.1;
        }

        return r1+r2;

    }

    public static double tonumber(char[] MS){
        double r1=0,r2=0;
        int ch;


        for(int i=0;MS[i]!='.';i++)
        {
            ch=MS[i]-'0';
            r1=r1*10+ch;
        }

        for(int j= MS.length-1;MS[j]!='.';j--){
            ch=MS[j]-'0';
            r2=(r2+ch)*0.1;
        }

        return r1+r2;

    }

}

