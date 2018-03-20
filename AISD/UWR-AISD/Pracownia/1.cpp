#include <cstdio>
#include <stack>

const int MAX = 1e6 + 1;

int children[MAX];
int descendants[MAX];
int timeIn[MAX];
int timeOut[MAX];

using namespace std;

int main() {
    int N, n, Q;
    scanf("%d %d", &N, &Q);

    fill_n(timeIn, N+1, -1);
    fill_n(timeOut, N+1, -1);

    for (int i = 2; i <= N; i++) {
        scanf("%d", &n);
        descendants[i] = children[n];
        children[n] = i;
    }

    int time = 0;
    stack<int> stackOfChildNodes;
    stackOfChildNodes.push(1);
    while (!stackOfChildNodes.empty()) {
        int current = stackOfChildNodes.top();
        stackOfChildNodes.pop();
        if (timeIn[current] == -1) {
            timeIn[current] = time;
            time++;
            stackOfChildNodes.push(current);
            int child = children[current];
            while (child != 0) {
                stackOfChildNodes.push(child);
                child = descendants[child];
            }
        }
        if (timeIn[current] != -1) {
            timeOut[current] = time-1;
        }
    }

    while(Q != 0) {
        int a, b;
        scanf("%d %d", &a, &b);
        if (timeIn[b] >= timeIn[a] && timeIn[b] <= timeOut[a]) {
            printf("TAK\n");
        }
        else {
            printf("NIE\n");
        }
        Q--;
    }
    return 0;
}