// Karol Rodziński
// 292236
// KPI
#include <cstdio>
using namespace std;

int main() {
  int a, b, first;
  scanf("%d %d", &a, &b);
  int modRem = a % 2018;
  int diff = b - a;
  if (modRem > diff) {
    return 0;
  }
  if (modRem != 0) {
    first = a + (2018 - modRem);
  }
  else {
    first = a;
  }
  for (int i = first; i <= b; i += 2018) {
    printf("%d ", i);
  }
  return 0;
}