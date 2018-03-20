const {promisify} = require('util');

const fs = require('fs');
const readFileAsync = promisify(fs.readFile);

function getData(fileName, type) {
    return new Promise(function(resolve, reject){
      fs.readFile(fileName, type, (err, data) => {
          if (err) { reject(err); }
          resolve(data);
      })
    });
}

async function main1() {
    try {
        const text = await readFileAsync("Data.json", {encoding: 'utf8'});
        console.log(text);
    }
    catch (err) {
        console.log('ERROR:', err);
    }
}
async function main2() {
    try {
        const text = await getData("Data.json", {encoding: 'utf8'});
        console.log(text);
    }
    catch (err) {
        console.log('ERROR:', err);
    }
}
main1();

main2();