function forEach (a, f) {
    for(var i = 0; i < a.length; i++) { 
      f(a[i], i, a)
    }
  }
function map(a, f) {
    var mapped = []
    forEach(a, function (elem, i, arr) {
      mapped.push(f(elem, i, arr))
    })
    return mapped;
  }

function filter(a, predicate) {
    var filtered = []
    forEach(a, function(elem, i, arr){
        if (predicate(elem, i, arr)) filtered.push(elem)
    })
    return filtered
}

var a = [1,2,3,4]
a.forEach(_ => { console.log(_) })
forEach(a, _ => { console.log(_ + "*2 = " + _*2 ); } )
console.log(filter(a, _ => _ < 3 ))
console.log(map(a, _ => _ * 2 ))
    