import os

def rename():
    i = 0
    path = r"train"

    filelist = os.listdir(path)   #该文件夹下所有的文件（包括文件夹）
    for files in filelist:   #遍历所有文件
        Olddir = os.path.join(path, files)    #原来的文件路径
        if os.path.isdir(Olddir):       #如果是文件夹则跳过
                continue
        filetype = '.jpg'        #文件扩展名
        Newdir = os.path.join(path,  str(i) + filetype)   #新的文件路径
        os.rename(Olddir, Newdir)    #重命名
        i = i + 1
    return True


if __name__ == '__main__':
    rename()