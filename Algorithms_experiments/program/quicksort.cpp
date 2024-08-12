#include<iostream>
#include<algorithm>
#define N 20

using namespace std;

void quicksort(int q[], int l, int r)
{
    if (l >= r) return;						//判边界
    int x = q[l], i = l - 1, j = r + 1;	
    while (i < j)
    {
        do i ++ ; while (q[i] < x);
        do j -- ; while (q[j] > x);
        if (i < j) swap(q[i], q[j]);
    }
    quicksort(q, l, j), quicksort(q, j + 1, r);
}

int main(){ 
	int n,q[N];
	cout<<"请输入元素个数与序列："<<endl;
	cin>>n;
	for(int i=0;i<n;i++){
		cin>>q[i];
	}
	
	quicksort(q,0,n-1);
	
	for(int i=0;i<n;i++){
		cout<<q[i]<<" ";
	}
	
	cout<<endl;
	system("pause");
	return 0;	
}


