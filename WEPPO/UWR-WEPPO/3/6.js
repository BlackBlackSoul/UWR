function createGenerator(num) {
    var _state = 0;
    return {
        next() {
            if (_state <= num) {
                return { value: _state++ };
            } else {
                return { done: true };
            }
        }
    }
}

var Object = {
    [Symbol.iterator] : createGenerator.bind(this, 20)
};
var Object1 = {
    [Symbol.iterator] : createGenerator.bind(this, 10)
}
var Object2 = {
    [Symbol.iterator] : createGenerator.bind(this, 2)
}

for (var f of Object) {
       console.log(f)
}
console.log("=================")
for (var f of Object1) {
    console.log(f)
}
console.log("=================")
for (var f of Object2) {
    console.log(f)
}

// DRUGIE 
// function createGenerator(n) {
//     return function() {
//       var _state = 0;
//       return {
//         next() {
//           if (_state <= n) {
//               return { value: _state++ };
//           } else {
//               return { done: true };
//           }
//         }
//       }
//     }
//   }
  
  
// var iterable = {
//     [Symbol.iterator]: createGenerator(5)
// };
// for (var f of iterable) {
//     console.log(f)
// }