package Strenword;

import java.util.Scanner;

public class strenword {
    public static void main(String[] args) {
        char[] ch={'i',' ','h','a','v','e',' ','a',' ','d','r','e','a','m','\0'};
        char[] ch1={'A','B','C',' ','E','F','G','\0'};
        char[] ch2={' ','B','C',' ','E','F','G','\0'};
        char[] ch3={'A','B','C',' ',' ','F','G','\0'};
        char[] ch4={'A','B','C',' ','E','F',' ','\0'};

        System.out.println(StrEnWord(ch));
        System.out.println(StrEnWord(ch1));
        System.out.println(StrEnWord(ch2));
        System.out.println(StrEnWord(ch3));
        System.out.println(StrEnWord(ch4));

        Scanner sc=new Scanner(System.in);
        System.out.println("请输入字符串：");
        String s=sc.next();

        System.out.println("单词个数：" + StrEnWord(s.toCharArray()));

    }

    public static int StrEnWord(char[] MS)
    {
        int num=0;
        char pre=' ';
        if(MS==null)
        {
            return num;
        }

        for (int i = 0;; i++) {
            if(MS[i]=='\0')
            {
                return num;
            }
            if(i>0)
            {
                pre=MS[i-1];
            }
            if(MS[i]!=' '&&pre==' ')
            {
                num++;
            }
            continue;
        }
    }
}
