EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:device.farm
LIBS:MCU_ST_STM32F0
LIBS:nanook-as-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Conn_01x02 J5
U 1 1 5C22FBED
P 5200 2850
AR Path="/5C22FBC8/5C22FBED" Ref="J5"  Part="1" 
AR Path="/5C23178F/5C22FBED" Ref="J6"  Part="1" 
AR Path="/5C2318B8/5C22FBED" Ref="J7"  Part="1" 
AR Path="/5C2319D5/5C22FBED" Ref="J8"  Part="1" 
F 0 "J8" H 5550 2700 50  0000 C CNN
F 1 "Conn_01x02" H 5550 2800 50  0000 C CNN
F 2 "Connectors_JST:JST_XH_B02B-XH-A_02x2.50mm_Straight" H 5200 2850 50  0001 C CNN
F 3 "" H 5200 2850 50  0001 C CNN
	1    5200 2850
	-1   0    0    1   
$EndComp
$Comp
L R R5
U 1 1 5C22FC9D
P 5500 3050
AR Path="/5C22FBC8/5C22FC9D" Ref="R5"  Part="1" 
AR Path="/5C23178F/5C22FC9D" Ref="R6"  Part="1" 
AR Path="/5C2318B8/5C22FC9D" Ref="R7"  Part="1" 
AR Path="/5C2319D5/5C22FC9D" Ref="R8"  Part="1" 
F 0 "R8" H 5650 3100 50  0000 C CNN
F 1 "100k" H 5700 3000 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 5430 3050 50  0001 C CNN
F 3 "" H 5500 3050 50  0001 C CNN
	1    5500 3050
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR034
U 1 1 5C22FCDE
P 5500 2700
AR Path="/5C22FBC8/5C22FCDE" Ref="#PWR034"  Part="1" 
AR Path="/5C23178F/5C22FCDE" Ref="#PWR037"  Part="1" 
AR Path="/5C2318B8/5C22FCDE" Ref="#PWR040"  Part="1" 
AR Path="/5C2319D5/5C22FCDE" Ref="#PWR043"  Part="1" 
F 0 "#PWR043" H 5500 2550 50  0001 C CNN
F 1 "+3V3" H 5500 2840 50  0000 C CNN
F 2 "" H 5500 2700 50  0001 C CNN
F 3 "" H 5500 2700 50  0001 C CNN
	1    5500 2700
	1    0    0    -1  
$EndComp
$Comp
L L L4
U 1 1 5C230C76
P 5850 2850
AR Path="/5C22FBC8/5C230C76" Ref="L4"  Part="1" 
AR Path="/5C23178F/5C230C76" Ref="L5"  Part="1" 
AR Path="/5C2318B8/5C230C76" Ref="L6"  Part="1" 
AR Path="/5C2319D5/5C230C76" Ref="L7"  Part="1" 
F 0 "L7" V 6000 2850 50  0000 C CNN
F 1 "22uH" V 5925 2850 50  0000 C CNN
F 2 "Inductors_SMD:L_0805" H 5850 2850 50  0001 C CNN
F 3 "" H 5850 2850 50  0001 C CNN
	1    5850 2850
	0    -1   -1   0   
$EndComp
$Comp
L C C8
U 1 1 5C230CB7
P 6150 3000
AR Path="/5C22FBC8/5C230CB7" Ref="C8"  Part="1" 
AR Path="/5C23178F/5C230CB7" Ref="C9"  Part="1" 
AR Path="/5C2318B8/5C230CB7" Ref="C10"  Part="1" 
AR Path="/5C2319D5/5C230CB7" Ref="C11"  Part="1" 
F 0 "C11" H 6300 3000 50  0000 L CNN
F 1 "100n" H 6250 2900 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 6188 2850 50  0001 C CNN
F 3 "" H 6150 3000 50  0001 C CNN
	1    6150 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2850 5700 2850
Text HLabel 6350 2850 2    60   Input ~ 0
ADC-IN
Wire Wire Line
	6000 2850 6350 2850
Connection ~ 6150 2850
$Comp
L GND #PWR035
U 1 1 5C230D1E
P 5500 3200
AR Path="/5C22FBC8/5C230D1E" Ref="#PWR035"  Part="1" 
AR Path="/5C23178F/5C230D1E" Ref="#PWR038"  Part="1" 
AR Path="/5C2318B8/5C230D1E" Ref="#PWR041"  Part="1" 
AR Path="/5C2319D5/5C230D1E" Ref="#PWR044"  Part="1" 
F 0 "#PWR044" H 5500 2950 50  0001 C CNN
F 1 "GND" H 5500 3050 50  0000 C CNN
F 2 "" H 5500 3200 50  0001 C CNN
F 3 "" H 5500 3200 50  0001 C CNN
	1    5500 3200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR036
U 1 1 5C230D38
P 6150 3150
AR Path="/5C22FBC8/5C230D38" Ref="#PWR036"  Part="1" 
AR Path="/5C23178F/5C230D38" Ref="#PWR039"  Part="1" 
AR Path="/5C2318B8/5C230D38" Ref="#PWR042"  Part="1" 
AR Path="/5C2319D5/5C230D38" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 6150 2900 50  0001 C CNN
F 1 "GND" H 6150 3000 50  0000 C CNN
F 2 "" H 6150 3150 50  0001 C CNN
F 3 "" H 6150 3150 50  0001 C CNN
	1    6150 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2750 5500 2750
Wire Wire Line
	5500 2750 5500 2700
Wire Wire Line
	5500 2850 5500 2900
Connection ~ 5500 2850
$EndSCHEMATC
