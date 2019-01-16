const i2c = require("@device.farm/usb-i2c-driver").open();

const address = 0x70;
const sensorCount = 9;

//let x = 0;


async function test() {
    try {
        console.info("-----------------------", new Date().toLocaleString(), "-----------------------");
        //await i2c.write(address, [x, 1, 2]);
        //x += 2;
        let data = Buffer.from(await i2c.read(address, sensorCount*2));
        for (let i = 0; i < sensorCount; i++) {
            console.info(i, data.readInt16LE(i * 2));
        }
    } catch (e) {
        console.error(e);
    }
    setTimeout(test, 1000);
}

test();
