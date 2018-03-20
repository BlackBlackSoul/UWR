// Karol Rodziński
// 292236
// KPI

#include <cstdio>

int fast_power_modular(int a, int b, int m) {
    int i;
    long long res = 1;
    long long x = a % m;
    for (i = 1; i <= b; i <<= 1) {
        x %= m;
        if ((b & i) != 0) {
            res *= x;
            res %= m;
        }
        x *= x;
    }
    return (int)res;
}

int main() {
    int t;
    scanf("%d", &t);
    while (t != 0) {
        int a, b, m;
        scanf("%d %d %d", &a, &b, &m);
        printf("%d\n", fast_power_modular(a, b, m));
        t--;
    }
    return 0;
}