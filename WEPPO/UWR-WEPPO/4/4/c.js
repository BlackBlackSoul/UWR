var moduleA = require('./a');

function ModuleC() {
}

ModuleC.hello = function () {
  moduleA.hello();
};

module.exports = ModuleC;
