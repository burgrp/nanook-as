short* vrefintCal = (short*)0x1FFFF7BA;

class PeriodicAdc {
	
	short* target;
	int analogSensCount; 
	int analogSensBaseIdx;

	int sensorIdx = 0;

public:

	void init(short* target, int analogSensCount, int analogSensBaseIdx) {

		target[analogSensCount - 1] = *vrefintCal;

		this->target = target;
		this->analogSensCount = analogSensCount;
		this->analogSensBaseIdx = analogSensBaseIdx;
		for (int c = 0; c < analogSensCount; c++) {
			target::GPIOA.MODER.setMODER(c + analogSensBaseIdx, 3);
		}

        target::ADC.CR.setADEN(1);
        target::ADC.CFGR2 = 1 << 30; // CKMODE[1:0] = 01, broken svd definition
        target::ADC.SMPR.setSMPR(7);
        target::ADC.IER.setEOCIE(1);
		target::ADC.CCR.setVREFEN(1);

        startAdcConversion();
	}

	void startAdcConversion() {
		int channelIdx = sensorIdx == analogSensCount - 2? 17: sensorIdx + analogSensBaseIdx;
		target::ADC.CHSELR.setCHSEL(1 << (channelIdx));
		target::ADC.CR.setADSTART(1);
	}

    void handleInterrupt() { 
        if (target::ADC.ISR.getEOC()) {
			int avg = (target::ADC.DR.getDATA() + this->target[sensorIdx]) / 2;
            this->target[sensorIdx] = avg;
            sensorIdx++;
            if (sensorIdx >= analogSensCount - 1) { // skip the last slot - it is set already by constant vrefintCal
                sensorIdx = 0;
            }    
			startAdcConversion();        
    	}
    }

};
