var Foo = function (foo) {
    this.a = foo
};

Foo.prototype.Bar = (function () {
    // Private methods
    function Qux() {
        return "PRIV"
    }

    // Public attributes and methods
    return function () {
            return "PUBLIC " + Qux()
        
    };
})();

    

var myObject = new Foo('bar');
console.log(myObject.a)  
console.log(myObject.Bar())
// console.log(myObject.Bar.Qux())  