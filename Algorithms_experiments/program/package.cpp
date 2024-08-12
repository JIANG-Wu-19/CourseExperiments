#include<iostream>
#include<algorithm>
using namespace std;
const int N = 20;
char l[35] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
struct Obj
{
	int id;			// ��Ʒ���
	int w;			// wΪ����Ʒ������
	int v;			// vΪ����Ʒ�ļ�ֵ
	float unit;		// ��λ�����ļ�ֵ
	bool operator< (const Obj& W)const
	{
		return unit < W.unit;
	}
}obj[N];

void FindMaxValue(int n, int m)
{
	float value = 0;
	sort(obj, obj + n);			// ���յ�λ�����ļ�ֵ����Ʒ������������
	for (int i = n - 1; i >= 0; i--)
	{
		if (m - obj[i].w >= 0)				// ����ʣ������
		{
			m -= obj[i].w;					// ȥ���ⲿ�ֵı�������
			value += obj[i].v;				// �����ⲿ�ֵļ�ֵ
			cout << "װ��������" << l[obj[i].id] << "����Ʒ" << endl;
			if (m == 0) break;
		}
		else
		{
			float ratio = (float) m / obj[i].w;
			cout << "װ��" << ratio * 100 << "%��" << l[obj[i].id] << "����Ʒ" << endl;
			value += ratio * obj[i].v;
			break;
		}
	}
	cout << "װ�뱳���е���Ʒ���ܼ�ֵ���Ϊ" << value << endl;
}

int main()
{
	int n, m;		// nΪ��Ʒ��, mΪ��������
	cout << "��������Ʒ���ͱ�������:";
	cin >> n >> m;
	cout << "�����������Ʒ�������ͼ�ֵ:\n";
	for (int i = 0; i < n; i++)
	{
		cin >> obj[i].w >> obj[i].v;
		obj[i].id = i;
		obj[i].unit = (float) obj[i].v / obj[i].w;
	}
	FindMaxValue(n, m);
	return 0;
}
