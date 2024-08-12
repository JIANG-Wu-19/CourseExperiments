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
	sort(mov, mov + m);					// ����������ʼ���ҵı������
	int res = 0, num = 0, work = 0;		// resΪ����
	while (work < m)
	{
		int num = 0;		// numΪ��ǰ���Ľ��ұ��
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
	int n, m;	// nΪ������, mΪҪ���˵Ĺ�����
	cin >> n >> m;
	for (int i = 0; i < m; i++)
	{
		cin >> mov[i].start >> mov[i].end;
		mov[i].use = false;
	}
	cout << runnum(n, m) << endl;
	return 0;
}
