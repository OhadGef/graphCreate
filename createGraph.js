const fs = require('fs');

const nodes = process.env.NODES;

console.log(process.env.NODES);

let tmp =[];
function getRandomScaleFreeGraphData(requiredNumOfNodes) {
    let currentNumOfNodes = 2;
    tmp.push([0,1]);
    const selectionArray = [0, 1];
    let selectionArrayLength = 2;

    while (currentNumOfNodes < requiredNumOfNodes) {
        currentNumOfNodes++;
        const randomIndex = Math.floor(Math.random() * selectionArrayLength);
        tmp.push([currentNumOfNodes - 1, selectionArray[randomIndex]]);
        selectionArray.push(currentNumOfNodes - 1);
        selectionArray.push(selectionArray[randomIndex]);
        selectionArrayLength += 2;
    }

}


getRandomScaleFreeGraphData(nodes);

// console.log(tmp);
console.log("end...");

fs.writeFile(`./data/${nodes}.json`, JSON.stringify(tmp), 'utf8',(err) =>{
    if (err) throw err;
    console.log('complete');
});


process.stdin.setRawMode(true);
process.stdin.resume();
process.stdin.on('data', process.exit.bind(process, 0));