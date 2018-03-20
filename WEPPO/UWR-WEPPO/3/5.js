function sum(...a) {
    let sum = 0 ;
    a.forEach(_ => sum += _)
    return sum
}

console.log(sum(1,2,3,4,5,6,7,8,9,10))