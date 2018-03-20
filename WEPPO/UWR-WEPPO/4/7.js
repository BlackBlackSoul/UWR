
const readline = require('readline');
const fs = require('fs');

function mostOccurency(array) {
    let modeMap = {};
    let maxEl = array[0], maxCount = 1;
    
    for(let i = 0; i < array.length; i++) {
        let el = array[i];
        
        if(modeMap[el] == null)
            modeMap[el] = 1;
        else
            modeMap[el]++;  
        
        if(modeMap[el] > maxCount) {
            maxEl = el;
            maxCount = modeMap[el];
        }
    }
    return maxEl;
}

function removeElement(nums, val) {
    for (let i=nums.length - 1; i >=0; i--) {
        if (nums[i] == val) {
            nums.splice(i,1);
        }
    }
};

function main() {
    const rl = readline.createInterface({
    input: fs.createReadStream('dataServer.txt'),
    crlfDelay: Infinity
    });

    let listOfHosts = []
    rl.on('line', (line) => {
        let str = line.split(" ")[0]
        listOfHosts.push(str)
    });
    rl.on('close', () => {
        let i = 0
        while (i++ != 3) {
            mostStr = mostOccurency(listOfHosts)
            console.log(i + ") " +mostStr)
            removeElement(listOfHosts, mostStr)
        }
    })
}
main()