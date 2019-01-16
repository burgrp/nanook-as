class FrequencyMeter: public genericTimer::Timer {
	int counter;
	int extiNo;
	short* target;
public:
	void init(int extiNo, short* target) {
		this->extiNo = extiNo;
		this->target = target;
		target::EXTI.FTSR.setTR(extiNo, 1);
		target::EXTI.IMR.setMR(extiNo, 1);
		start(100);
	}

	virtual void onTimer() {
		*target = counter;
		counter = 0;
		start(100);
	}

	void handleInterrupt() {
		if (target::EXTI.PR.getPR(extiNo)) {
			counter++;
			target::EXTI.PR.setPR(extiNo, 1);
		}
	}
};
