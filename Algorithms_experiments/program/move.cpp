#include<iostream>
#include<algorithm>
using namespace std;

const int N = 20;
struct Move {
	int start;
	int end;
	bool use;
	bool operator< (const Move& W)const
	{
		return start < W.start;
	}
}mov[N];

int runnum(int n, int m)
{
	sort(mov, mov + m);					// 按照任务起始教室的编号排序
	int res = 0, num = 0, work = 0;		// res为趟数
	while (work < m)
	{
		int num = 0;		// num为当前到的教室编号
		for (int i = 0; i < m; i++)
		{
			if (mov[i].use == false && mov[i].start >= num)
			{
				mov[i].use = true;
				work++;
				num = mov[i].end;
				if (num == n) break;
			}
		}
		res++;
	}
	return res;
}

int main()
{
	int n, m;	// n为教室数, m为要搬运的工作数
	cin >> n >> m;
	for (int i = 0; i < m; i++)
	{
		cin >> mov[i].start >> mov[i].end;
		mov[i].use = false;
	}
	cout << runnum(n, m) << endl;
	return 0;
}
