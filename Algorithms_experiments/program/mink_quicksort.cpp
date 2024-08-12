#include<iostream>
#include<algorithm>
using namespace std;
const int N = 20;

int quicksort(int a[], int l, int r)
{
	int pivot = a[l];						
	int i = l - 1, j = r + 1;
	do
	{
		do { i++; } while (a[i] < pivot);
		do { j--; } while (a[j] > pivot);
		if (i < j)  swap(a[i], a[j]);
	} while (i < j);

	return j;
}

void Top_k(int a[], int l, int r, int k)
{
	if (l >= r) return;
	int j = quicksort(a, l, r);
	int count = j - l + 1;					
	if (count == k)
	{
		return;
	}
	else if(count > k)
	{
		Top_k(a, l, j, k);					
	}
	else
	{
		Top_k(a, j + 1, r, k - count);		
	}
}

int main()
{
	int a[N], k, n;
	cout << "请输入元素个数与序列:" << endl;
	cin >> n;
	for (int i = 0; i < n; i++)
	{
		cin >> a[i];
	}
	cout << "请输入要获得的第k小数" << endl;
	cin >> k;
	
	Top_k(a, 0, n - 1, k);
    
	cout << "第" << k << "小数是" << a[k - 1] << endl;
	cout << endl;
	return 0;
}
