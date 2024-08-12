#include<iostream>
using namespace std;
const int N = 100;
int p[N];		// 矩阵规模
int m[N][N];	// 最优解
int s[N][N];

void MatrixChain(int n)
{
	int r, i, j, k;
	for (i = 0; i <= n; i++)				// 初始化对角线
	{
		m[i][i] = 0;
	}
	for (r = 2; r <= n; r++)				// r 个矩阵连乘
	{
		for (i = 1; i <= n - r + 1; i++)	// 依次计算每r个矩阵相连乘的最优解情况
		{
			j = i + r - 1;
			m[i][j] = m[i][i] + m[i + 1][j] + p[i - 1] * p[i] * p[j];
			s[i][j] = i;					// 分隔位置
			for (k = i + 1; k < j; k++)		 // 变换分隔位置，逐一测试
			{
				int t = m[i][k] + m[k + 1][j] + p[i - 1] * p[k] * p[j];
				if (t < m[i][j])			// 如果变换后的位置更优，则替换原来的分隔方法
				{
					m[i][j] = t;
					s[i][j] = k;
				}
			}
		}
	}
}

void print(int i, int j)		// 输出连乘顺序
{
	if (i == j)
	{
		cout << "p[" << i << "]";
		return;
	}
	cout << "(";
	print(i, s[i][j]);
	print(s[i][j] + 1, j);
	cout << ")";
}

int main()
{
	int n;			// n个矩阵
	cout << "请输入矩阵的数目：";
	cin >> n;
	int i, j;
	cout << "请输入各个矩阵的维度(相邻维度只需输入一个即可):";
	for (i = 0; i <= n; i++)
	{
		cin >> p[i];
	}
	MatrixChain(n);
	cout << "最佳添加括号的方式为：";
	print(1, n);
	cout << "\n最小计算量的值为：" << m[1][n] << endl;
	return 0;
}

