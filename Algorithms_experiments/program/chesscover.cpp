#define _CRT_SECURE_NO_WARNINGS 1
#include<iostream>  
using namespace std;
int num = 1;                   //L型骨牌的编号(递增)  
int board[100][100];  //棋盘  
/*****************************************************
* tr--当前棋盘左上角的行号
* tc--当前棋盘左上角的列号
* dr--当前特殊方格所在的行号
* dc--当前特殊方格所在的列号
* size：当前棋盘的:2^k
*****************************************************/
void chessboardCover(int tr, int tc, int dr, int dc, int size) {
    if (size == 1)
        return;

    int t = num++;
    int s = size / 2;

    // 左上角子棋盘
    if (dr < tr + s && dc < tc + s)
        chessboardCover(tr, tc, dr, dc, s);
    else {
        // 不在左上角，用t号骨牌覆盖右下角
        board[tr + s - 1][tc + s - 1] = t;
        // 覆盖其他方格
        chessboardCover(tr, tc, tr + s - 1, tc + s - 1, s);
    }

    // 右上角子棋盘
    if (dr < tr + s && dc >= tc + s)
        chessboardCover(tr, tc + s, dr, dc, s);
    else {
        // 不在右上角，用t号骨牌覆盖左下角
        board[tr + s - 1][tc + s] = t;
        // 覆盖其他方格
        chessboardCover(tr, tc + s, tr + s - 1, tc + s, s);
    }

    // 左下角子棋盘
    if (dr >= tr + s && dc < tc + s)
        chessboardCover(tr + s, tc, dr, dc, s);
    else {
        // 不在左下角，用t号骨牌覆盖右上角
        board[tr + s][tc + s - 1] = t;
        // 覆盖其他方格
        chessboardCover(tr + s, tc, tr + s, tc + s - 1, s);
    }

    // 右下角子棋盘
    if (dr >= tr + s && dc >= tc + s)
        chessboardCover(tr + s, tc + s, dr, dc, s);
    else {
        // 不在右下角，用t号骨牌覆盖左上角
        board[tr + s][tc + s] = t;
        // 覆盖其他方格
        chessboardCover(tr + s, tc + s, tr + s, tc + s, s);
    }
}

int main()
{
    int size;
    cout << "输入棋盘的size(大小必须是2的n次幂): ";
    cin >> size;
    int index_x, index_y;
    cout << "输入特殊方格位置的坐标: ";
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

