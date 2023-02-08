from machine import ADC, Pin
import time

adc_pin = 3
addr_pin0 = 15
addr_width = 3

addr_pins = []
for b in range(addr_width):
    print(f'{addr_pin0 + b}')
    pin = Pin(12, Pin.OUT)
    pin.value(0)
    addr_pins.append(pin)

adc = ADC(Pin(adc_pin, Pin.IN))

def readChannel(ch):
    for b in range(addr_width):
        addr_pins[b].value((ch >> b) & 1)

    return adc.read_uv()

while True:
    print('----------------------------------')
    for ch in range(7):
        value = readChannel(ch)
        print(f'{ch}={value}')

    time.sleep(1)


