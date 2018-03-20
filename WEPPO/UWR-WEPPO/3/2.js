// Comparision
// Default
function fibonacci(n) {
    if (n <= 1)
      return n;
    else
      return fibonacci(n - 1) + fibonacci(n - 2);
  }
// Regular
var fibonacciMemo = (function() {
  var memo = [0, 1];
  return fib = function(n) {
    let result;
    return (result = memo[n]) !== undefined ? result : memo[n] = fib(n - 1) + fib(n - 2);
  };
})();

console.log(fibonacci(10))
console.time("memo")
fibonacciMemo(40)
console.timeEnd("memo")
console.time("regular")
fibonacci(40)
console.timeEnd("regular")