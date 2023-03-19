from machine import ADC, Pin, I2C
import time

side_pin = 0

adc_pin = 3
addr_pin0 = 8
addr_width = 3

addr_pins = []
for b in range(addr_width):
    pin = Pin(addr_pin0 + b, Pin.OUT)
    pin.value(0)
    addr_pins.append(pin)

adc = ADC(Pin(adc_pin, Pin.IN), atten=ADC.ATTN_11DB)

# The ESP32-C3 variant is meant as drop-in replacement for the original board based on STM32F030.
# Due to the different ADC band gap voltage, we have to use different R2 resistors, but the board should report voltages
# as we would use the original R2 resistors. Thus we have to correct the measured values.
# For example, if the original R2 was 4k7 and we have 10k, we have to multiply the measured value by 10k/(4k7+10k)
correction = [
    [
        1.0,
        1.0,
        66000/(56000+66000),
        66000/(56000+66000),
        66000/(56000+66000),
        66000/(56000+66000)
    ],
    [
        1.0,
        1.0,
        10000/(4700+10000),
        6650/(4700+6650),
        780/(1500+780),
        10000/(4700+10000)
    ]
]

side_pin = Pin(side_pin, Pin.IN)
side = side_pin.value()

print('Side: ' + 'HOT' if side else 'COLD')

def readChannel_uV(ch):
    #ch = 4

    for b in range(addr_width):
        addr_pins[b].value((ch >> b) & 1)

    time.sleep_ms(100)
    return adc.read_uv()

while True:
    print('----------------------------------')
    for ch in range(6):
        value_uV = readChannel_uV(ch)
        value = value_uV*4095*correction[side][ch]//3300000
        print(f'{ch}={value_uV}uV ({value} raw)')

    time.sleep(1)
