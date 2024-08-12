import pandas as pd
import numpy as np
from matplotlib import pyplot as plt
from sklearn.manifold import TSNE
from sklearn.preprocessing import StandardScaler


data = []


# 查看数据的整体情况和缺失值
def describe():
    airline_data = pd.read_csv("../data/air_data.csv",
                               encoding="gb18030")  # 导入航空数据
    explore = airline_data.describe().T
    explore['null'] = len(airline_data) - explore['count']
    explore.to_csv('数据描述.csv')
    df = explore[['max', 'min', 'null']]
    nullData = df[df['null'] > 0]
    nullData = nullData['null']
    nullData.to_csv('空值项数量.csv')
    return airline_data


# 删除缺失值和异常值
def data_cleaning(airline_data):
    exp1 = airline_data["SUM_YR_1"].notnull()
    exp2 = airline_data["SUM_YR_2"].notnull()
    exp = exp1 & exp2
    # print('exp的形状是：', exp.shape)
    airline_notnull = airline_data.loc[exp, :]
    # print('删除缺失记录后数据的形状为：', airline_notnull.shape)

    # 只保留票价非零的，或者平均折扣率不为0且总飞行公里数大于0的记录。
    index1 = airline_notnull['SUM_YR_1'] != 0
    index2 = airline_notnull['SUM_YR_2'] != 0
    index3 = (airline_notnull['SEG_KM_SUM'] > 0) & \
             (airline_notnull['avg_discount'] != 0)
    airline = airline_notnull[(index1 | index2) & index3]
    return airline


# 数据筛选
def data_selection(airline):
    # 选取需求特征
    """
    L: 入会时间
    FLIGHT_COUNT: F 乘机次数
    LAST_TO_END: R 最近消费次数
    avg_discount: C 折扣率
    SEG_KM_SUM: M 飞行里程数
    """
    airline_selection = airline[["FFP_DATE", "LOAD_TIME",
                                 "FLIGHT_COUNT", "LAST_TO_END",
                                 "avg_discount", "SEG_KM_SUM"]]
    L = pd.to_datetime(airline_selection["LOAD_TIME"]) - \
        pd.to_datetime(airline_selection["FFP_DATE"])
    L = L.astype("str").str.split(' ').str[0]
    # 获得会员入会的月数
    L = L.astype("int") / 30
    # 合并特征
    airline_features = pd.concat([L, airline_selection.iloc[:, 2:]], axis=1)
    return airline_features


# 数据标准化
def data_normalization(airline_features):
    global data
    data = StandardScaler().fit_transform(airline_features)
    np.savez('../tmp/airline_scale.npz', data)
    print('标准化后LRFMC五个特征为：\n', data[:5, :])


def main():
    airline_data = describe()
    airline = data_cleaning(airline_data)
    airline_features = data_selection(airline)
    data_normalization(airline_features)


if __name__ == '__main__':
    main()
