#define _CRT_SECURE_NO_WARNINGS 1
#include<iostream>  
using namespace std;
int num = 1;                   //L�͹��Ƶı��(����)  
int board[100][100];  //����  
/*****************************************************
* tr--��ǰ�������Ͻǵ��к�
* tc--��ǰ�������Ͻǵ��к�
* dr--��ǰ���ⷽ�����ڵ��к�
* dc--��ǰ���ⷽ�����ڵ��к�
* size����ǰ���̵�:2^k
*****************************************************/
void chessboardCover(int tr, int tc, int dr, int dc, int size) {
    if (size == 1)
        return;

    int t = num++;
    int s = size / 2;

    // ���Ͻ�������
    if (dr < tr + s && dc < tc + s)
        chessboardCover(tr, tc, dr, dc, s);
    else {
        // �������Ͻǣ���t�Ź��Ƹ������½�
        board[tr + s - 1][tc + s - 1] = t;
        // ������������
        chessboardCover(tr, tc, tr + s - 1, tc + s - 1, s);
    }

    // ���Ͻ�������
    if (dr < tr + s && dc >= tc + s)
        chessboardCover(tr, tc + s, dr, dc, s);
    else {
        // �������Ͻǣ���t�Ź��Ƹ������½�
        board[tr + s - 1][tc + s] = t;
        // ������������
        chessboardCover(tr, tc + s, tr + s - 1, tc + s, s);
    }

    // ���½�������
    if (dr >= tr + s && dc < tc + s)
        chessboardCover(tr + s, tc, dr, dc, s);
    else {
        // �������½ǣ���t�Ź��Ƹ������Ͻ�
        board[tr + s][tc + s - 1] = t;
        // ������������
        chessboardCover(tr + s, tc, tr + s, tc + s - 1, s);
    }

    // ���½�������
    if (dr >= tr + s && dc >= tc + s)
        chessboardCover(tr + s, tc + s, dr, dc, s);
    else {
        // �������½ǣ���t�Ź��Ƹ������Ͻ�
        board[tr + s][tc + s] = t;
        // ������������
        chessboardCover(tr + s, tc + s, tr + s, tc + s, s);
    }
}

int main()
{
    int size;
    cout << "�������̵�size(��С������2��n����): ";
    cin >> size;
    int index_x, index_y;
    cout << "�������ⷽ��λ�õ�����: ";
    getchar();
    cin>>index_x>>index_y;
    chessboardCover(0, 0, index_x - 1, index_y - 1, size);
    for (int i = 0; i < size; i++)
    {
        for (int j = 0; j < size; j++)
            cout << board[i][j] << "\t";
        cout << endl;
    }
}

