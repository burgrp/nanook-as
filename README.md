# nanook-as
NANOOK analog sensors board

 ![nanook-as with ESP32C3](board/render.png)

|COLD        |WATER IN |WATER OUT|FRIGO IN|FRIGO OUT|
|------------|---------|---------|--------|---------|
|            |   R7    |   R8    |   R9   |   R10   |
| t          |-14..14  |-14..14  |-14..14 |-14..14  |
| R          |66k      |66k      |66k     |66k      |


|HOT         |WATER IN |WATER OUT|FRIGO IN|FRIGO OUT|
|------------|---------|---------|--------|---------|
|            |   R7    |   R8    |   R9   |   R10   |
| t          |26..59   |36..70   |96..143 |26..59   |
| R1         |10k      |6.65k    |780R    |10k      |

Values calculated for Vin=3.3V Vout=150mV...2450mV (11dB attenuation on ADC).
TODO: redesign board to provide 2.5V Vin to achieve wider range.

Pressure sensor dividers remain unchanged, as maximum pressures at 2450mV for cold and hot side are 7.2bar and 26bar resp.

```plantuml
Bob -> Alice : hello
Alice -> Bob : hi
```
