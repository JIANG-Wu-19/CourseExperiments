#include<iostream>
#include<algorithm>
using namespace std;

const int N = 100010;

int n, m;
int h[N], cnt;

void down(int u)
{
    int t = u;			// tΪ�㡢���ӡ��Һ�������������С��һ����
    if (u * 2 <= cnt && h[u * 2] < h[t]) t = u * 2;
    if (u * 2 + 1 <= cnt && h[u * 2 + 1] < h[t]) t = u * 2 + 1;
    if (u != t)			// ���ڵ㲻����С��
    {
        // ����С�ĵ㽻��
        swap(h[u], h[t]);
        down(t);		// �ݹ鴦��
    }
}

void up(int u)
{
    while (u / 2 && h[u] < h[u / 2])
    {
        swap(h[u / 2], h[u]);
        u >>= 1;		// u /= 2����ȥ
    }
}

void HeapSort(int h[], int k, int n)
{
    for (int i = n / 2; i; i--) down(i);	// O(n)��ʱ�临�ӶȽ���

    while (m--)
    {
        if(m == 0){
        	cout<<h[1]<<endl;
		}
        h[1] = h[cnt--];
        down(1);
    }
}

int main()
{
    cin>>n>>m;
    for (int i = 1; i <= n; i++) cin>>h[i];
    cnt = n;
    HeapSort(h, m, n);
    return 0;
}

