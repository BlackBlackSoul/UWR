const fs = require('fs');

function fileread(filename){
    
        var contents= fs.readFileSync(filename);
        return contents;
    }
function openAndRead(file) {
    fs.open(file, 'r', (err, data) => {
        if (err) {
          if (err.code === 'ENOENT') {
            console.error('File: ' + file + ' does not exist');
            return;
          }
      
          throw err;
        }
        console.log(fileread(data).toString());
      });
}
openAndRead(process.argv.slice(2).toString())