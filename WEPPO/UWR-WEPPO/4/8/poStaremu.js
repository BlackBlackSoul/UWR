const util = require('util');
const fs = require('fs');

const readFileAsync = util.promisify(fs.readFile); // (A)

function getData(fileName, type) {
    return new Promise(function(resolve, reject){
      fs.readFile(fileName, type, (err, data) => {
          if (err) { reject(err); }
          resolve(data);
      })
    });
}

getData("Data.json", {encoding: 'utf8'})
  .then((text) => {
      console.log(text);
  })
  .catch((err) => {
      console.log('ERROR:', err);
});

readFileAsync("Data.json", {encoding: 'utf8'})
  .then((text) => {
      console.log(text);
  })
  .catch((err) => {
      console.log('ERROR:', err);
});