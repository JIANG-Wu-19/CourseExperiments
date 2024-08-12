#include<iostream>
#include<map>
#include<vector>
using namespace std;
const int N = 20;
int l[N], top[N];		// top[N] 表示山峰的编号
struct Mou
{
	int x;
	int y;
	int l;				// l 为顶点能被灯照到的左端点
	int r;				// r 为顶点能被灯照到的右端点
};
vector<Mou> mou;

void FindLightRegion(int m, int n, int t)
{
	for (int i = 0; i < m; i++)			// 遍历每个顶点
	{
		for (int j = 0; j < n; j++)		// 遍历每个灯
		{
			bool flag = true;

			if (l[j] != mou[i].x)
			{
				// 计算直线的斜率k和截距b
				float k = (float)(t - mou[i].y) / (l[j] - mou[i].x);
				float b = t - k * l[j];
				int s = i;
				while ((l[j] < mou[i].x && --s && l[j] < mou[s].x)
					|| (l[j] > mou[i].x && ++s && l[j] > mou[s].x))		// 遍历灯到该点区间内的所有点
				{
					if (k * mou[s].x + b < mou[s].y)
					{
						flag = false;
						break;
					}
				}
			}

			if (flag)
			{
				if (mou[i].l == -1)
				{
					mou[i].l = mou[i].r = j;
				}
				else
				{
					mou[i].r++;
				}
			}
			else
			{
				if (l[j] > mou[i].x)
					break;				// 无需继续遍历
			}
		}
	}
}

int FindMinLight(int m, int n, int t)
{
	int res = 0;
	FindLightRegion(m, n, t);	// 得到每个顶点被哪些灯照到, 记录到 l 和 r 中
	while (mou.size() != 0)
	{
		// 统计区间每个数出现的次数
		int max = 0, cishu = 0;
		for (auto t : mou)
		{
			map<int, int> nums;
			for (int i = t.l; i <= t.r; i++)
			{
				nums[i]++;
			}
			// 找出区间中出现次数最多的数
			for (auto num : nums)
			{
				if (num.second > cishu)
				{
					max = num.first;
					cishu = num.second;
				}
			}
		}
		// 将出现次数最多的数设为当前需要的灯, 然后删除所有有关的顶点
		res++;
		for (auto it = mou.begin(); it != mou.end();)
		{
			if (it[0].l <= max && it[0].r >= max)
				it = mou.erase(it);
			else
				++it;
		}
	}
	return res;
}

int main()
{
	int m, n, t;			// m为山棱转折点的个数, n为灯泡个数, t为灯泡的高度	
	cin >> m;
	for (int i = 0; i < m; i++)
	{
		int x, y;
		cin >> x >> y;
		mou.push_back({ x,y,-1,-1 });	// 转折点的水平坐标和垂直海拔高度, 并预初始化区间
	}
	cin >> n >> t;
	for (int i = 0; i < n; i++)
	{
		cin >> l[i];
	}
	cout << "开灯最少的数量是" << FindMinLight(m, n, t);
	return 0;
}