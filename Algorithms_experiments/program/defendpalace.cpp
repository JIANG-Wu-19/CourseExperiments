#include <cstring>
#include <iostream>
#include <algorithm>

using namespace std;

const int N = 1510;

int n;
int h[N], w[N], e[N], ne[N], idx;
int f[N][3];
bool st[N];

void add(int a, int b)
{
    e[idx] = b, ne[idx] = h[a], h[a] = idx ++ ;
}

void dfs(int u)
{
    f[u][2] = w[u];

    for (int i = h[u]; ~i; i = ne[i])
    {
        int j = e[i];		// 遍历所有子节点
        dfs(j);
        f[u][0] += min(f[j][1], f[j][2]);
        f[u][2] += min(min(f[j][0], f[j][1]), f[j][2]);
    }

    f[u][1] = 1e9;
    for (int i = h[u]; ~i; i = ne[i])
    {
        int j = e[i];
        // f[u][0]为所有子节点的摆放方案代价之和, 减去 min(f[j][1], f[j][2]) 即是除了j节点其余节点的代价之和
        f[u][1] = min(f[u][1], f[j][2] + f[u][0]- min(f[j][1], f[j][2]));
    }
}

int main()
{
    cin >> n;

    memset(h, -1, sizeof h);
    for (int i = 1; i <= n; i ++ )
    {
        int id, cost, cnt;
        cin >> id >> cost >> cnt;
        w[id] = cost;           // 在点上记录花费
        while (cnt -- )
        {
            int ver;
            cin >> ver;
            add(id, ver);
            st[ver] = true;     // 标记不是根节点
        }
    }

    int root = 1;
    while (st[root]) root ++ ;  // 找到根节点

    dfs(root);

    cout << min(f[root][1], f[root][2]) << endl;

    return 0;
}
