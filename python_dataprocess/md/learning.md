```python
_hello="helloworld"
score=0
y=20
y=True
```


```python
print(_hello)
```

    helloworld
    


```python
print(score)
```

    0
    


```python
print(y)
```

    True
    

# 变量
python是动态类型语言，不检查数据类型
可以接收其他类型的数据


```python
a=b=c=10
```

* python支持链式赋值语句


```python
print(a)
```

    10
    


```python
#coding=utf-8
#file:chapter4/4.4/hello.py

_hello="helloworld"
score_for_student=10.0 #没有错误发生
y=20

name1="Tom";name2="Tony"
#链式赋值语句
a=b=c=10

if y>10:
    print(y)
    print(score_for_student)
else:
    print(y*10)
print(_hello)
```

    20
    10.0
    helloworld
    


```python
#coding=utf-8
#file:chapter4/4.4/hello.py

_hello="helloworld"
score_for_student=10.0 #没有错误发生
y=20

name1="Tom";name2="Tony"
#链式赋值语句
a=b=c=10

if y>10:
    print(y)
    print(score_for_student)
else:
    print(y*10)
print(_hello)
```

    20
    10.0
    helloworld
    


```python
# coding=utf-8
import module1
from module1 import z

y=20

print(y)
print(module1.y)
print(z)
```

    20
    True
    10.0
    


```python
# coding=utf-8
import module1
from module1 import z

y=20

print(y)
print(module1.y)
print(z)
```

    20
    True
    10.0
    


```python
import com.pkg2.hello as module1
from com.pkg2.hello import z as x
print(x)
y=20
print(y)
print(module1.y)
print(z)
```

    10.1
    20
    True
    10.0
    

# 编码规范

## 命名规范
* 包名： 全部小写字母，中间可以由的隔开，不推荐使用下画线。作为命名空间，包名野窍应该具有唯一性，推荐采用公司或组织域名的倒置，如com.apple . quicktime . v2 。
* 模块名： 全部小写字母，如果是多个单词构成， 可以用下画线隔开， 如dummy_threading 。
* 类名： 采用大驼峰法命名③，如SplitViewController 。
* 异常名：异常属于类， 命名同类命名，但应该使用Error 作为后缀。如FileNotFoundError 。
* 变量名： 全部小写字母，如果由多个单词构成，可以用下画线隔开。如果变量应用于模块或函数内部，则变量名可以由单下画线开头： 变量类内部私有使用变量名可以双下画线开头。不要命名双下画线开头和结尾的变量，这是Python 保留的。另外，避免使用小写L 、大写0 和大写I 作为变量名。
* 函数名和方法名： 命名同变量命名，如balance_account 、_push_cm_ exit 。
* 常量名： 全部大写字母，如果是由多个单词构成，可以用下画线隔开，如YEAR 和WEEK OF MONTH 。

## 注释规范
单行注释、多行注释和文档注释
### 文件注释
文件注释就是在每一个文件开头添加注释，采用多行注释。文件注释通常包括如下信息：版权信息、文件名、所在模块、作者信息、历史版本信息、文件内容和作用等。
```
#
#版权所有2015 北京智捷东方科技有限公司
#许可信息查看LICENSE . txt 文件
#描述：
# 实现日期基本功能
#历史版本：
# 2015 7 22 ：创建关东升
# 2015 - 8 - 20 ： 添加socket 库
# 2015 - 8 - 22 ：添加math 库
#
```
上述注释只是提供了版权信息、文件内容和历史版本信息等，文件注释要根据实际情况包
括内容。

### 文档注释
### 代码注释
### 使用todo注释

## 导入规范
导入语句应该按照从通用到特殊的顺序分组， 顺序是： 标准库→ 第三方库→ 自己模块。每一组之间有一个空行，而且组中模块是按照英文字母顺序排序的。
```
import io
import os
import pkgutil
import platform
import re
import sys
import time
from html import unescape
from com.pkgl import example
```

## 代码规范
### 空行
* import 语句块前后保留两个空行
* 函数声明之前保留两个空行
* 类声明之前保留两个空行
* 方法声明之前保留一个空行
* 两个逻辑代码块之间应该保留一个空行
### 空格
* 赋值符号“＝”前后各有一个空格
* 所有的二元运算符都应该使用空格与操作数分开
* 一元运算符：算法运算符取反“”和运算符取反“ ～ ”
* 括号内不要有空格， Python 中括号包括小括号“（）飞中括号“ ［］”和大括号“｛｝”
* 不要在逗号、分号、冒号前面有空格，而是要在它们后面有一个空格，除非该符号已经是行尾了
* 参数列表、索引或切片的左括号前不应有空格
### 缩进
4 个空格常被作为缩进排版的一个级别。虽然在开发时程序员可以使用制表符进行缩进，而默认情况下一个制表符等于8 个空格，但是不同的IDE 工具中一个制表符与空格对应个数会有不同，所以不要使用制表符缩进。
### 断行
一行代码中最多79 个字符， 对于文档注释和多行注释时一行最多72 个字符，但是如果注释中包含URL 地址可以不受这个限制。否则，如果超过则需断行，可以依据下面的一般规范断开。
* 在逗号后面断开
* 在运算符前面断开
* 尽量不要使用续行符“ ＼ ” ， 当有括号（包括大括号、中括号和小括号） 则在括号中断开， 这样可以不使用续行符

# 数据类型
## 数字类型
### 整数类型


```python
28
```




    28




```python
0b11100
```




    28




```python
0o34
```




    28




```python
0x1c
```




    28



### 浮点类型


```python
1.0
```




    1.0




```python
0.0
```




    0.0




```python
3.36e2
```




    336.0




```python
1.56e-2
```




    0.0156



### 复数类型


```python
1+2j
```




    (1+2j)




```python
(1+2j)+(1+2j)
```




    (2+4j)



### 布尔类型


```python
bool(0)
```




    False




```python
bool(2)
```




    True




```python
bool(1)
```




    True




```python
bool('')
```




    False




```python
bool(' ')
```




    True




```python
bool([])
```




    False




```python
bool({})
```




    False



## 数字类型相互转换
### 隐式类型转换


```python
a=1+True
```


```python
print(a)
```

    2
    


```python
a=1.0+1
```


```python
type(a)
```




    float




```python
print(a)
```

    2.0
    


```python
a=1.0+True
```


```python
print(a)
```

    2.0
    


```python
a=1.0+1+True
```


```python
print(a)
```

    3.0
    


```python
a=1.0+1+False
```


```python
print(a)
```

    2.0
    

### 显式类型转换


```python
int(False)
```




    0




```python
int(True)
```




    1




```python
int(19.6)
```




    19




```python
float(5)
```




    5.0




```python
float(False)
```




    0.0




```python
float(True)
```




    1.0



## 字符串类型
### 字符串表示方式


```python
s = 'Hello World'
```


```python
print(s)
```

    Hello World
    


```python
s="Hello World"
```


```python
print(s)
```

    Hello World
    


```python
s='\u0048\u0065\u006c\u006c\u006f\u0020\u0057\u006f\u0072\u006c\u0064'
```


```python
print(s)
```

    Hello World
    


```python
s="\u0048\u0065\u006c\u006c\u006f\u0020\u0057\u006f\u0072\u006c\u0064"
```


```python
print(s)
```

    Hello World
    

* 转义符


```python
s='Hello\n World'
```


```python
print(s)
```

    Hello
     World
    


```python
s='Hello\t World'
```


```python
print(s)
```

    Hello	 World
    


```python
s='Hello \'World'
print(s)
```

    Hello 'World
    


```python
s="hello'world"
print(s)
```

    hello'world
    


```python
s='hello"world'
print(s)
```

    hello"world
    


```python
s='hello\\world'
print(s)
```

    hello\world
    


```python
s='hello\u005c world'
print(s)
```

    hello\ world
    

* 原始字符串


```python
s='hello\tworld'
print(s)
```

    hello	world
    


```python
s=r'hello\tworld'
print(s)
```

    hello\tworld
    

* 长字符串


```python
s='''hello
world'''
print(s)
```

    hello
    world
    


```python
s='''hello
\tworld'''
print(s)
```

    hello
    	world
    

### 字符串格式化


```python
name='Mary'
age=18
s='她的年龄是{0}岁。'.format(age)
print(s)
```

    她的年龄是18岁。
    


```python
s='{0}芳龄是{1}岁'.format(name,age)
print(s)
```

    Mary芳龄是18岁
    


```python
s='{1}芳龄是{0}岁'.format(age,name)
print(s)
```

    Mary芳龄是18岁
    


```python
s='{n}芳龄是{a}岁'.format(n=name,a=age)
print(s)
```

    Mary芳龄是18岁
    


```python
name='Mary'
age=18
money=1234.5678
"{0}芳龄是{1:d}岁。".format(name,age)
```




    'Mary芳龄是18岁。'




```python
"{1}芳龄是{0:5d}岁。".format(age,name)
```




    'Mary芳龄是   18岁。'




```python
"{0}今天收入是{1:f}元".format(name,money)
```




    'Mary今天收入是1234.567800元'




```python
"{0}今天收入是{1:.2f}".format(name,money)
```




    'Mary今天收入是1234.57'




```python
"{0}今天收入是{1:10.2f}".format(name,money)
```




    'Mary今天收入是   1234.57'




```python
"{0}今天收入是{1:g}".format(name,money)
```




    'Mary今天收入是1234.57'




```python
"{0}今天收入是{1:G}".format(name,money)
```




    'Mary今天收入是1234.57'




```python
"{0}今天收入是{1:e}".format(name,money)
```




    'Mary今天收入是1.234568e+03'




```python
"{0}今天收入是{1:E}".format(name,money)
```




    'Mary今天收入是1.234568E+03'



### 字符串查找


```python
source_str="there is a string accessing example"
len(source_str)
```




    35




```python
source_str[16]
```




    'g'




```python
source_str.find('r')
```




    3




```python
source_str.rfind('r')
```




    13




```python
source_str.find('ing')
```




    14




```python
source_str.rfind('ing')
```




    24




```python
source_str.find('e',15)
```




    21




```python
source_str.find('ing',5)
```




    14




```python
source_str.rfind('ing',5)
```




    24




```python
source_str.find('ing',18,28)
```




    24




```python
source_str.find('ingg',5)
```




    -1



#### 字符串与数字相互转换


```python
int('9')
```




    9




```python
int('9.6')
```


    ---------------------------------------------------------------------------

    ValueError                                Traceback (most recent call last)

    Input In [24], in <cell line: 1>()
    ----> 1 int('9.6')
    

    ValueError: invalid literal for int() with base 10: '9.6'



```python
float('9.6')
```




    9.6




```python
int('AB')
```


    ---------------------------------------------------------------------------

    ValueError                                Traceback (most recent call last)

    Input In [26], in <cell line: 1>()
    ----> 1 int('AB')
    

    ValueError: invalid literal for int() with base 10: 'AB'



```python
str(3.24)
```




    '3.24'




```python
str(True)
```




    'True'




```python
str([])
```




    '[]'




```python
str([1,2,3])
```




    '[1, 2, 3]'




```python
str(34)
```




    '34'




```python
'{0:2f}'.format(3.24)
```




    '3.240000'




```python
'{:.1f}'.format(3.24)
```




    '3.2'




```python
'{:10.1f}'.format(3.24)
```




    '       3.2'



# 运算符
## 算数运算符
### 一元运算符


```python
a=12
-a
```




    -12



### 二元运算符


```python
1+2
```




    3




```python
2-1
```




    1




```python
2*3
```




    6




```python
3/2
```




    1.5




```python
3%2
```




    1




```python
3//2
```




    1




```python
-3//2
```




    -2




```python
10**2
```




    100




```python
10.22+10
```




    20.22




```python
10.0+True+2
```




    13.0




```python
'hello'+'world'
```




    'helloworld'




```python
'hello'+2
```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    Input In [47], in <cell line: 1>()
    ----> 1 'hello'+2
    

    TypeError: can only concatenate str (not "int") to str



```python
'hello'*2
```




    'hellohello'



## 关系运算符


```python
a=1
b=2
a>b
```




    False




```python
a<b
```




    True




```python
a>=b
```




    False




```python
a<=b
```




    True




```python
1.0!=1
```




    False




```python
a='hello'
b='hello'
a==b
```




    True




```python
a='World'
a>b
```




    False




```python
a<b
```




    True




```python
a=[]
b=[1,2]
a==b
```




    False




```python
a<b
```




    True




```python
a=[1,2]
a==b
```




    True



## 逻辑运算符


```python
i=0
a=10
b=9

if a>b or i==1:
    print("或运算为真")
else:
    print("或运算为假")
    
if a<b and i==1:
    print("与运算为真")
else:
    print("与运算为假")
    

def f1():
    return a>b

def f2():
    print('--f2--')
    return a==b

print(f1() or f2())
```

    或运算为真
    与运算为假
    True
    

## 位运算符


```python
a=0b10110010
b=0b01011110
print("a|b={0}".format(a|b))
print("a&b={0}".format(a&b))
print("a^b={0}".format(a^b))
print("~a={0}".format(~a))
print("a>>2={0}".format(a>>2))
print("a<<2={0}".format(a<<2))
c=-0b1100
print("c>>2={0}".format(c>>2))
print("c<<2={0}".format(c<<2))
```

    a|b=254
    a&b=18
    a^b=236
    ~a=-179
    a>>2=44
    a<<2=712
    c>>2=-3
    c<<2=-48
    

## 赋值运算符


```python
a=1
b=2

a+=b
print(a)

a+=b+3
print(a)

a-=b
print(a)

a*=b
print(a)

a/=b
print(a)

a%=b
print(a)

a=0b10110010
b=0b01011110

a|=b
print(a)

a^=b
print(a)
```

    3
    8
    6
    12
    6.0
    0.0
    254
    160
    

## 其他运算符
### 同一性测试运算符
### 成员测试运算符


```python
class Person:
    def __init__(self,name,age):
        self.name=name
        self.age=age
        
p1=Person('Tony',18)
p2=Person('Tony',18)

print(p1==p2)
print(p1 is p2)

print(p1!=p2)
print(p1 is not p2)
```

    False
    False
    True
    True
    


```python
class Person:
    def __init__(self,name,age):
        self.name=name
        self.age=age
    
    def __eq__(self,other):
        if self.name==other.name and self.age==other.age:
            return True
        else:
            return False
  
        
p1=Person('Tony',18)
p2=Person('Tony',18)

print(p1==p2)
print(p1 is p2)

print(p1!=p2)
print(p1 is not p2)
    
```

    True
    False
    False
    True
    


```python
string_a='hello'
print('e' in string_a)
print('ell' not in string_a)

list_a=[1,2]
print(2 in list_a)
print(1 not in list_a)
```

    True
    False
    True
    False
    

# 控制语句
## 分支语句
### if结构


```python
score=5

if score>=85:
    print('perfect')
if score<60:
    print('hard')
if score>=60 and score<85:
    print('justsoso')
```

    hard
    

### if-else结构


```python
score=75

if score>=60:
    print('justsoso')
    if score>=90:
        print('perfect')
else:
    print("不及格")
```

    justsoso
    

### elif结构


```python
score=80

if score>=90:
    grade='A'
elif score>=80:
    grade='B'
elif score>=70:
    grade='C'
elif score>=60:
    grade='D'
else:
    grade='F'
    
print(grade)
```

    B
    

### 条件表达式


```python
score=85
result='justsoso' if score>=60 else 'hard'
print(result)
```

    justsoso
    

## 循环语句
### while语句


```python
i=0

while i*i<100_000:
    i+=1

print(i)
print(i*i)
```

    317
    100489
    

### for语句


```python
print('----范围----')
for num in range(1,10):
    print("{0}*{0}={1}".format(num,num*num))

print('----字符串----')
for item in "hello":
    print(item)
    
print('----整数列表----')
numbers=[43,32,53,54,75,7,10]
for item in numbers:
    print(item)
```

    ----范围----
    1*1=1
    2*2=4
    3*3=9
    4*4=16
    5*5=25
    6*6=36
    7*7=49
    8*8=64
    9*9=81
    ----字符串----
    h
    e
    l
    l
    o
    ----整数列表----
    43
    32
    53
    54
    75
    7
    10
    

## 跳转语句
### break语句


```python
for item in range(10):
    if item==3:
        break
    print(item)
```

    0
    1
    2
    

### continue语句


```python
for item in range(10):
    if item==3:
        continue
    print(item)
```

    0
    1
    2
    4
    5
    6
    7
    8
    9
    

### while和for中的else语句


```python
i=0

while i*i<10:
    i+=1
    print("{0}*{0}={1}".format(num,num*num))
else:
    print("whileover")
    
print('----------')

for item in range(10):
    if item==3:
        break
    print(item)
else:
    print('forover')
```

    9*9=81
    9*9=81
    9*9=81
    9*9=81
    whileover
    ----------
    0
    1
    2
    

## 使用范围
range()函数语法：
$$
range([start,]stop[,step])
$$


```python
for item in range(1,10,2):
    print(item)
print('------------')

for item in range(1,-10,-3):
    print(item)
```

    1
    3
    5
    7
    9
    ------------
    1
    -2
    -5
    -8
    


```python

```
