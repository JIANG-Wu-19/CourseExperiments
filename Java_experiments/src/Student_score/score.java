package Student_score;

import javax.swing.text.AbstractDocument;
import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;

public class score {
    public static void main(String[] args) throws IOException{
        try{
            Scanner sc1=new Scanner(System.in);
            System.out.println("请输入学生成绩的存储地址：");
            String a=sc1.nextLine();
            ArrayList<String> content=new ArrayList<>();

            File f=new File(a);
            if(f.isFile()&&f.exists())
            {
                InputStreamReader Reader=new InputStreamReader(new FileInputStream(f));

                BufferedReader bufferedReader=new BufferedReader(Reader);

                String linetext=null;

                while((linetext=bufferedReader.readLine())!=null)
                {
                    content.add(linetext);
                }
                Reader.close();

            }
            else
            {
                System.out.println("找不到指定文件");
            }

/*打印content
            for (String s : content) {
                System.out.println(s);
            }
*/

            Student[] students=new Student[content.size()];

/*测试追加txt内容
            String app="\n111111111";
            FileWriter fw=null;

            BufferedWriter output=new BufferedWriter(new FileWriter(f,true));
            output.write(app);
            output.flush();
            output.close();
*/
/*测试学生成绩设置
            String line="张三 8210212526 语文 95";
            Student st=set(line);
            System.out.println(st.getName());
            System.out.println(st.getSnumber());
            System.out.println(st.getCourse());
            System.out.println(st.getScore());
*/
            //设置学生成员
            for (int i = 0; i < students.length; i++) {
                students[i]=set(content.get(i));
            }

            //对成绩进行降序排序
            bubblesort(students);
/*排序测试
            for (int i = 0; i < students.length; i++) {
                System.out.println(students[i].getName());
                System.out.println(students[i].getSnumber());
                System.out.println(students[i].getCourse());
                System.out.println(students[i].getScore());
            }
*/

            //统计数据，0~59、60~79、80~90、90~100等分数段的人数进行统计分析

            int l1=0,l2=0,l3=0,l4=0;//>90 l1,>80 l2,>60 l3,l4

            for (int i = 0; i < students.length; i++) {
                if(Integer.parseInt(students[i].getScore())>90)
                {
                    l1++;
                }
                else if(Integer.parseInt(students[i].getScore())>80)
                {
                    l2++;
                }
                else if(Integer.parseInt(students[i].getScore())>60)
                {
                    l3++;
                }
                else
                {
                    l4++;
                }
            }

            //进行文件内容追加
            String app="\n90~100的人数:"+l1+"\t"+" 80~89的人数:"+l2+"\t"+" 60~79的人数:"+l3+"\t"+" 0~59的人数:"+l4;
            FileWriter fw=null;

            BufferedWriter output=new BufferedWriter(new FileWriter(f,true));
            output.write("\n");
            for (int i = 0; i < students.length; i++) {
                output.write("\n"+students[i].getName()+" "+students[i].getSnumber()+" "+students[i].getCourse()+" "+students[i].getScore());
            }
            output.write("\n"+app);
            output.write("\n"+ new Date());
            output.flush();
            output.close();

            System.out.println("数据分析已完成！");
        }catch(IOException e)
        {
            System.out.println("读取文件内容出错");
            e.printStackTrace();
        }

    }

    public static Student set(String line)
    {

        String[] property=line.split(" ");
        Student s=new Student(property[0],property[1],property[2],property[3]);
        return s;
    }

    //降序排序方法
    public static void bubblesort(Student[] students)
    {
        for (int i = 0; i < students.length-1; i++) {
            for(int k=0;k< students.length-1-i;k++)
            {
                if(Integer.parseInt(students[k].getScore())<Integer.parseInt(students[k+1].getScore()))
                {
                    Student temp=students[k];
                    students[k]=students[k+1];
                    students[k+1]=temp;
                }
            }
        }
    }

}
