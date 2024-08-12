import numpy as np
import pandas as pd
from matplotlib import pyplot as plt
from sklearn.cluster import KMeans
from sklearn.manifold import TSNE
from sklearn.metrics import fowlkes_mallows_score, silhouette_score, calinski_harabasz_score


# 读入数据
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC


def read_data():
    airline_scale = np.load('../tmp/airline_scale.npz')['arr_0']
    return airline_scale


# 聚类数据分析
def cluster(airline_scale):
    k = 5   # 聚类中心数
    kmeans_model = KMeans(n_clusters=k, n_init=4, random_state=666)
    kmeans_model.fit(airline_scale)  # 模型训练
    print('聚类中心:\n', kmeans_model.cluster_centers_)  # 查看聚类中心
    print('类别标签:\n', kmeans_model.labels_)  # 查看样本的类别标签
    # 统计不同类别样本的数目
    r1 = pd.Series(kmeans_model.labels_).value_counts()
    print('最终每个类别的数目为：\n', r1)
    return kmeans_model


# FMI评价法
def FMI(airline_scale, kmeans_model):
    for i in range(2, 7):
        kmeans = KMeans(n_clusters=i, random_state=123).fit(airline_scale)
        # print(kmeans.labels_)
        # print(type(kmeans.labels_))
        score = fowlkes_mallows_score(kmeans_model.labels_, kmeans.labels_)
        # print('数据聚%d类FMI评价分值为：%f' % (i, score))


# silhouetteScore相似度评价法
def SS(airline_scale):
    silhouetteScore = []
    for i in range(2, 7):
        kmeans = KMeans(n_clusters=i, random_state=123).fit(airline_scale)
        score = silhouette_score(airline_scale, kmeans.labels_)
        print('航空公司数据聚%d类silhouette评价分值为：%f' % (i, score))
        silhouetteScore.append(score)
    plt.figure(figsize=(10, 6))
    plt.plot(range(2, 7), silhouetteScore, linewidth=1.5, linestyle="-")
    plt.show()


# calinski_harabaz指数评价法
def CH(airline_scale):
    ch = []
    for i in range(2, 7):
        # 构建并训练模型
        kmeans = KMeans(n_clusters=i, random_state=123).fit(airline_scale)
        score = calinski_harabasz_score(airline_scale, kmeans.labels_)
        print('航空公司数据聚%d类calinski_harabaz指数为：%f' % (i, score))
        ch.append(score)
    plt.figure(figsize=(10, 6))
    plt.plot(range(2, 7), ch, linewidth=1.5, linestyle="-")
    plt.show()


# 用支持向量机预测数据
def SVC_prediction(airline_scale, kmeans_model):
    # 划分测试集和训练集
    airline_data_train, airline_data_test, airline_target_train, airline_target_test = \
        train_test_split(airline_scale, kmeans_model.labels_, test_size=0.2, random_state=666)

    # 数据标准化
    stdScaler = StandardScaler().fit(airline_data_train)
    airline_trainStd = stdScaler.transform(airline_data_train)
    airline_testStd = stdScaler.transform(airline_data_test)

    svm = SVC().fit(airline_trainStd, airline_target_train)
    print('建立的SVM模型为：\n', svm)

    #  预测训练集结果
    airline_target_pred = svm.predict(airline_testStd)
    print('预测前20个结果为：\n', airline_target_pred[:20])


# 画雷达图
def draw(kmeans_model=None):
    datafile = '标准数据.csv'
    data = pd.read_csv(datafile)
    r2 = pd.DataFrame(kmeans_model.cluster_centers_)  # 聚类的中心数学数值
    print(r2)
    r3 = pd.Series(['客户群1', '客户群2', '客户群3', '客户群4', '客户群5', ])
    labels = np.array(['L', 'R', 'F', 'M', 'C'])  # 标签
    dataLength = 5  # 数据个数
    r4 = r2.T
    print(data.columns)
    r4.columns = list(data.columns)
    fig = plt.figure()
    y = []
    for x in list(data.columns):
        dt = r4[x]
        dt = np.concatenate((dt, [dt[0]]))
        y.append(dt)
    ax = fig.add_subplot(111, polar=True)
    angles = np.linspace(0, 2 * np.pi, dataLength, endpoint=False)
    angles = np.concatenate((angles, [angles[0]]))
    labels = np.concatenate((labels, [labels[0]]))
    ax.plot(angles, y[0], 'b-', linewidth=2)
    ax.plot(angles, y[1], 'r-', linewidth=2)
    ax.plot(angles, y[2], 'g-', linewidth=2)
    ax.plot(angles, y[3], 'y-', linewidth=2)
    ax.plot(angles, y[4], 'm-', linewidth=2)
    plt.rcParams['font.sans-serif'] = ['SimHei']
    plt.rcParams['axes.unicode_minus'] = False  # 用来正常显示负号
    ax.legend(r3, loc=1)
    ax.set_thetagrids(angles * 180 / np.pi, labels, fontproperties="SimHei")
    ax.set_title("用户价值分析雷达图", va='bottom', fontproperties="SimHei")
    ax.grid(True)
    plt.show()


# 降维图像分析
def dimensionality_reduction(airline_scale, kmeans_model):
    tsne = TSNE(n_components=2, init='random',
                random_state=177).fit(airline_scale)
    # init：初始化，可以是PCA或random；随机数种子
    df = pd.DataFrame(tsne.embedding_)  # 将原始数据转换为DataFrame
    print(df)
    df['labels'] = kmeans_model.labels_  # 将聚类结果存储进df数据表
    print(df['labels'])

    # 提取不同标签的数据
    df1 = df[df['labels'] == 0]
    df2 = df[df['labels'] == 1]
    df3 = df[df['labels'] == 2]
    df4 = df[df['labels'] == 3]
    df5 = df[df['labels'] == 4]

    #  绘制图形
    fig = plt.figure(figsize=(9, 6))  # 设定空白画布，并制定大小
    # 用不同的颜色表示不同数据
    plt.plot(df2[0], df2[1], 'r*')
    plt.plot(df3[0], df3[1], 'gD')
    plt.plot(df4[0], df4[1], 'kD')
    plt.plot(df5[0], df5[1], 'lD')
    plt.savefig('../tmp/聚类结果.png')
    plt.show()  # 显示图片


def main():
    airline_scale = read_data()
    kmeans_model = cluster(airline_scale)
    # FMI(airline_scale, kmeans_model)
    # SS(airline_scale)
    # CH(airline_scale)
    # SVC_prediction(airline_scale, kmeans_model)
    # dimensionality_reduction(airline_scale, kmeans_model)
    draw(kmeans_model)


if __name__ == '__main__':
    main()
