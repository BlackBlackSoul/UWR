var moduleC = require('./c');

function ModuleB() {
}
ModuleB.hello = function () {
  moduleC.hello();
};

module.exports = ModuleB;