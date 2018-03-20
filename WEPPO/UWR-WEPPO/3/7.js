function* fibGen() {
    var fn1 = 0;
    var fn2 = 1;
    while (true) {  
        var current = fn1;
        fn1 = fn2;
        fn2 = current + fn1;
        yield current;
    }
}

function fib() {
    var fn1 = 0;
    var fn2 = 1;
    return {
        next : function() {
            var current = fn1
            fn1 = fn2;
            fn2 = current + fn1;  
            return {
                value : current,  
                done : false
            }
        }
    }
}
    
console.log("GENERATORS")
for ( var i of fibGen() ) {
    if (i > 1000) break;
    console.log(i)
}
console.log("==================")
var _it = fibGen();
for ( var _result; _result = _it.next(), !_result.done; ) {
    if (_result.value > 1000) break;
    else {
        console.log( _result.value );
    }
}
console.log("ITERATORS")
var _it = fib();
for ( var _result; _result = _it.next(), !_result.done; ) {
    if (_result.value > 1000) break;
    else {
        console.log( _result.value );
    }
}