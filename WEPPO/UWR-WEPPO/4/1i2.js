function Node(value, left = null, right = null) {
    this.value = value;
    this.left = left;
    this.right = right;
}
Node.prototype[Symbol.iterator] = function* () {
    yield this.value;
    if (this.left) yield* this.left; 
    if (this.right) yield* this.right;
}

function height(node){
    if(!node) return 0;
    var leftHeight = height(node.left);
    var rightHeight = height(node.right);
 
    return Math.max(leftHeight, rightHeight) + 1;
}

let tree = new Node(4, 
    new Node(1, new Node(2), new Node(3)),
    new Node(1, new Node(2), new Node(3)))

for (var value of tree) {
    console.log(value);
}
console.log("Height: " + height(tree))