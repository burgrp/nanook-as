#include <climits>

const int analogSensCount = 8;
const int analogSensBaseIdx = 1;	

class IAS3 {

	iwdg::Driver iwdg;
	short data[1 + analogSensCount];

public:

	i2c::hw::BufferedSlave i2c;
	FrequencyMeter frequencyMeter;
	PeriodicAdc adc;

	void init(target::i2c::Peripheral* peripheral, int address) {
		for (int i = 0; i < sizeof(data) / sizeof(data[0]); i++) {
			data[i] = 0;
		}
		iwdg.init();
		i2c.init(peripheral, address, NULL, 0, (unsigned char*)&data, sizeof(data));
		frequencyMeter.init(0, &data[0]);
		adc.init(&data[1], analogSensCount, analogSensBaseIdx);		
	}

};

IAS3 ias3;

void interruptHandlerI2C1() {
	ias3.i2c.handleInterrupt();
}

void interruptHandlerADC() {	
	ias3.adc.handleInterrupt();
}

void interruptHandlerEXTI0_1() {
	ias3.frequencyMeter.handleInterrupt();
}

void initApplication() {

	target::RCC.AHBENR.setIOPAEN(true);
	
	// I2C peripheral
	target::GPIOA.AFRH.setAFRH(9, 4);
	target::GPIOA.AFRH.setAFRH(10, 4);
	target::GPIOA.MODER.setMODER(9, 2);
	target::GPIOA.MODER.setMODER(10, 2);
	target::RCC.APB1ENR.setC_EN(1, 1);
	target::NVIC.ISER.setSETENA(1 << target::interrupts::External::I2C1);

	// ADC peripheral
	target::RCC.APB2ENR.setADCEN(1);
	target::NVIC.ISER.setSETENA(1 << target::interrupts::External::ADC);

	// EXTI for frequency meter	
	target::GPIOA.MODER.setMODER(0, 0);
	target::GPIOA.PUPDR.setPUPDR(0, 1);
	target::SYSCFG.EXTICR1.setEXTI(0, 0);
	target::NVIC.ISER.setSETENA(1 << target::interrupts::External::EXTI0_1);

	// check address switch
	const int addrPin = 1;
	volatile target::gpio_b_f::Peripheral* addrPort = &target::GPIOB;
	int address;
	addrPort->MODER.setMODER(addrPin, 0);
	addrPort->PUPDR.setPUPDR(addrPin, 1);
	for (volatile int c = 0; c < 1000; c++);
	if (addrPort->IDR.getIDR(addrPin) == 0) {
		address = 0x70;
	} else {
		addrPort->PUPDR.setPUPDR(addrPin, 2);
		for (volatile int c = 0; c < 1000; c++);
		if (addrPort->IDR.getIDR(addrPin) == 1) {
			address = 0x71;
		} else {
			address = 0x72;
		}
	}

	ias3.init(&target::I2C1, address);	
}
