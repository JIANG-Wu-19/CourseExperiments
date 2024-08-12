#include<iostream>
#include<map>
#include<vector>
using namespace std;
const int N = 20;
int l[N], top[N];		// top[N] ��ʾɽ��ı��
struct Mou
{
	int x;
	int y;
	int l;				// l Ϊ�����ܱ����յ�����˵�
	int r;				// r Ϊ�����ܱ����յ����Ҷ˵�
};
vector<Mou> mou;

void FindLightRegion(int m, int n, int t)
{
	for (int i = 0; i < m; i++)			// ����ÿ������
	{
		for (int j = 0; j < n; j++)		// ����ÿ����
		{
			bool flag = true;

			if (l[j] != mou[i].x)
			{
				// ����ֱ�ߵ�б��k�ͽؾ�b
				float k = (float)(t - mou[i].y) / (l[j] - mou[i].x);
				float b = t - k * l[j];
				int s = i;
				while ((l[j] < mou[i].x && --s && l[j] < mou[s].x)
					|| (l[j] > mou[i].x && ++s && l[j] > mou[s].x))		// �����Ƶ��õ������ڵ����е�
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
					break;				// �����������
			}
		}
	}
}

int FindMinLight(int m, int n, int t)
{
	int res = 0;
	FindLightRegion(m, n, t);	// �õ�ÿ�����㱻��Щ���յ�, ��¼�� l �� r ��
	while (mou.size() != 0)
	{
		// ͳ������ÿ�������ֵĴ���
		int max = 0, cishu = 0;
		for (auto t : mou)
		{
			map<int, int> nums;
			for (int i = t.l; i <= t.r; i++)
			{
				nums[i]++;
			}
			// �ҳ������г��ִ���������
			for (auto num : nums)
			{
				if (num.second > cishu)
				{
					max = num.first;
					cishu = num.second;
				}
			}
		}
		// �����ִ�����������Ϊ��ǰ��Ҫ�ĵ�, Ȼ��ɾ�������йصĶ���
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
	int m, n, t;			// mΪɽ��ת�۵�ĸ���, nΪ���ݸ���, tΪ���ݵĸ߶�	
	cin >> m;
	for (int i = 0; i < m; i++)
	{
		int x, y;
		cin >> x >> y;
		mou.push_back({ x,y,-1,-1 });	// ת�۵��ˮƽ����ʹ�ֱ���θ߶�, ��Ԥ��ʼ������
	}
	cin >> n >> t;
	for (int i = 0; i < n; i++)
	{
		cin >> l[i];
	}
	cout << "�������ٵ�������" << FindMinLight(m, n, t);
	return 0;
}