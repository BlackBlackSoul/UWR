var Car = {
    brand : undefined,
    'model' : undefined,
    set setBrand(brand) {
        this.brand = brand;
    },
    get getBrand() {
        return this.brand;
    }
}

// TEST

// 1
console.log(Car.brand)
Car.brand = "renault"
console.log(Car.brand)
console.log(Car.model)
// 2

Car.foo = function(word) {return word}


Car.color = "red"
Car["condition"] = true

Object.defineProperty(Car, 'date', {
    value : undefined,
    writable: true,
    enumerable: true,
    configurable: true
})

var id = 1
Object.defineProperty(Car, 'ID', {
    get: function() { return id},
    set: function(newID) { id = newID},
    enumerable: true,
    configurable: true
})

console.log("Add attribute with get&set: ")
console.log(Car.ID)
Car.ID = 2
console.log(Car.ID)
console.log("Add field to object using define property: ")
console.log(Car.date)
Car.date = new Date();
console.log(Car.date)
console.log("Add method to object: ")
console.log(Car.foo("Added"))
console.log("Add field to object: ")
console.log(Car.color)
console.log(Car.condition)