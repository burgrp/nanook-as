const table = require("./ntc-10k-3950.json");

function calcResistance(t) {
    for (let i in table) {
        if (table[i][0] === t) {
            return table[i][1];
        } else if (table[i][0] > t) {
            let r0 = table[i - 1][1];
            let t0 = table[i - 1][0];
            let r1 = table[i][1];
            let t1 = table[i][0];
            return (t - t0) / (t1 - t0) * (r1 - r0) + r0;
        }
    }
}

function calcVoltage(t, r1, vcc) {
    let rt = calcResistance(t);
    return vcc * r1 / (rt + r1);
}

function calcError(t, r1, vcc) {
    let v0 = calcVoltage(t, r1, vcc);
    let v1 = calcVoltage(t + 1, r1, vcc);
    return vcc / (v1 - v0);
}

let availResistors = [270, 1500, 4700, 10000, 56000, 100000];
let ranges = [[-15, 15], [10, 60], [10, 70], [10, 130], [10, 60]];
let vcc = 3.3;

ranges.forEach(range => {
    let minError;
    let minErrorR1;
    availResistors.forEach(r1 => {
        let error = Math.max(calcError(range[0], r1, vcc), calcError(range[1], r1, vcc));
        if (minError === undefined || error < minError) {
            minError = error;
            minErrorR1 = r1;
        }
    });
    console.info(`${range[0]}°C...${range[1]}°C ${minErrorR1}Ω ${calcVoltage(range[0], minErrorR1, vcc).toFixed(2)}V...${calcVoltage(range[1], minErrorR1, vcc).toFixed(2)}V`);
});
