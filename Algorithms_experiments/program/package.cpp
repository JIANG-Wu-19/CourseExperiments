#include<iostream>
#include<algorithm>
using namespace std;
const int N = 20;
char l[35] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
struct Obj
{
	int id;			// 物品序号
	int w;			// w为各物品的重量
	int v;			// v为各物品的价值
	float unit;		// 单位重量的价值
	bool operator< (const Obj& W)const
	{
		return unit < W.unit;
	}
}obj[N];

void FindMaxValue(int n, int m)
{
	float value = 0;
	sort(obj, obj + n);			// 按照单位重量的价值对物品进行升序排序
	for (int i = n - 1; i >= 0; i--)
	{
		if (m - obj[i].w >= 0)				// 存在剩余容量
		{
			m -= obj[i].w;					// 去掉这部分的背包容量
			value += obj[i].v;				// 加入这部分的价值
			cout << "装入整个第" << l[obj[i].id] << "个物品" << endl;
			if (m == 0) break;
		}
		else
		{
			float ratio = (float) m / obj[i].w;
			cout << "装入" << ratio * 100 << "%第" << l[obj[i].id] << "个物品" << endl;
			value += ratio * obj[i].v;
			break;
		}
	}
	cout << "装入背包中的物品的总价值最大为" << value << endl;
}

int main()
{
	int n, m;		// n为物品数, m为背包容量
	cout << "请输入物品数和背包容量:";
	cin >> n >> m;
	cout << "请输入各个物品的重量和价值:\n";
	for (int i = 0; i < n; i++)
	{
		cin >> obj[i].w >> obj[i].v;
		obj[i].id = i;
		obj[i].unit = (float) obj[i].v / obj[i].w;
	}
	FindMaxValue(n, m);
	return 0;
}
