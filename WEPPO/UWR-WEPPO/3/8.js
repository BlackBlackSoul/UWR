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


function* take(it, top) {
    var next = it.next()
    var i = 0;
    while(i++ < top) {
        yield next.value
        next = it.next()
    }
}

for (let num of take( fibGen(), 10)) {
    console.log(num);
}