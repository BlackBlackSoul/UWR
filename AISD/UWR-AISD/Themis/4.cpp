#include <cstdio>
using namespace std;

void multiply(long long f[][2],long long g[][2], long long m) {
    long long a=(f[0][0]*g[0][0]+f[0][1]*g[1][0])%m;
    long long b=(f[0][0]*g[0][1]+f[0][1]*g[1][1])%m;
    long long c=(f[1][0]*g[0][0]+f[1][1]*g[1][0])%m;
    long long d=(f[1][0]*g[0][1]+f[1][1]*g[1][1])%m;

    f[0][0]=a;
    f[0][1]=b;
    f[1][0]=c;
    f[1][1]=d;
}
void power(long long f[2][2],long long n, long long m) {
    long long g[2][2]={{1,1},{1,0}};
    if(n==0||n==1)
    return;
    power(f,n/2,m);
    multiply(f,f,m);

    if(n%2==1)
    multiply(f,g,m);
}
long long fib(long long n, long long m) {
    long long f[2][2]={{1,1},{1,0}};
    if(n==0)
    return 0;
    power(f,n-1,m);
    return f[0][0]%m;
}

int main() {
  int t;
  long long m,n;
  scanf("%d", &t);
  while(t != 0) {
    scanf("%lld %lld", &n, &m);
    printf("%lld ", fib(n,m));
    t--;
  }
  return 0;
}