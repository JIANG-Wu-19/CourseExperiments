#include<iostream>
using namespace std;
const int N = 20;

void bubblesort(int a[], int k, int n)
{
	for (int i = 0; i < k; i++)
	{
		for (int j = n - 2; j >= i; j--)		 
		{
			if (a[j + 1] < a[j])			
			{
				int temp = a[j];
				a[j] = a[j + 1];
				a[j + 1] = temp;
			}
		}
	}
}

int main()
{
	int a[N], k, n;
	cout << "������Ԫ�ظ���������:" << endl;
	cin >> n;
	for (int i = 0; i < n; i++)
	{
		cin >> a[i];
	}
	cout << "������Ҫ��õĵ�kС��" << endl;
	cin >> k;
	bubblesort(a, k, n);
	cout << a[k - 1] << endl;
	return 0;
}

