// Karol Rodziński
// 292236
// KPI

#include <cstdio>
#include <vector>
using namespace std;

int getIndex(vector<int> seq, int xi) {
    return seq.end() - lower_bound(seq.begin(), seq.end(), xi);
}

int main() {
  int n, m, xi;
  scanf("%d", &n);
  vector<int> seq(n);

  for(int i = 0; i < n; i++) {
    scanf("%d", &seq[i]);
  } 

  scanf("%d", &m);
  while(m != 0) {
    scanf("%d", &xi);
    printf("%d ", getIndex(seq, xi));
    m--;
  }
  return 0;
}