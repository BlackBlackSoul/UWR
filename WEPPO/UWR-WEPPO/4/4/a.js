function ModuleA() {
}

module.exports = ModuleA;

var moduleB = require('./b');

ModuleA.hello = function () {
  console.log('hello!');
};