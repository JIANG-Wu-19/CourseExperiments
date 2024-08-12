#include <sstream>
#include <iostream>
#include <algorithm>

using namespace std;

const int N = 1000;

int h[N], f[N], q[N];		// q数组记录开好的子序列结尾的数

void FindMissileNum(int n)
{
    int res = 0;
    for (int i = 0; i < n; i ++ )
    {
        f[i] = 1;
        for (int j = 0; j < i; j ++ )
            if (h[i] <= h[j])
                f[i] = max(f[i], f[j] + 1);
        res = max(res, f[i]);
    }
    cout<<res<<endl;
}

int main()
{
    int n=0;
    while (cin >> h[n])  n ++ ;	
    FindMissileNum(n);
    return 0;
}


