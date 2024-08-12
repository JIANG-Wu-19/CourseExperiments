package iocopy;

import java.io.*;
import java.util.Date;
import java.util.Scanner;

public class Filecopy {
    public static void main(String[] args) throws IOException{
        try{
            Scanner sc1=new Scanner(System.in);
            System.out.println("请输入复制的目标源文件地址：");
            String a=sc1.nextLine();

            File file1=new File(a);
            Scanner sc2=new Scanner(System.in);
            System.out.println("请输入复制目的地址");
            String b=sc2.nextLine();
            File file2=new File(b);

            file2.getParentFile().mkdirs();
            file2.createNewFile();
            System.out.println(file2.exists());

            FileInputStream fis=new FileInputStream(file1);
            FileOutputStream fos=new FileOutputStream(file2);

            byte[] data=new byte[8096];

            int i=0;
            while((i= fis.read(data))>0){
                fos.write(data);
            }
            fis.close();
            fos.close();

            System.out.println("目标文件复制完成！");
            System.out.println("目标文件最后修改时间：" + new Date(file2.lastModified()));
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
