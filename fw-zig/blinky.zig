const std = @import("std");
const microzig = @import("microzig");
const peripherals = microzig.chip.peripherals;
const TIMG0 = peripherals.TIMG0;
const RTC_CNTL = peripherals.RTC_CNTL;
const INTERRUPT_CORE0 = peripherals.INTERRUPT_CORE0;
const GPIO = peripherals.GPIO;

const dogfood: u32 = 0x50D83AA1;
const super_dogfood: u32 = 0x8F1D312A;

pub fn main() !void {
    TIMG0.WDTWPROTECT.raw = dogfood;
    TIMG0.WDTCONFIG0.raw = 0;
    TIMG0.WDTWPROTECT.raw = 0;

    RTC_CNTL.WDTWPROTECT.raw = dogfood;
    RTC_CNTL.WDTCONFIG0.raw = 0;
    RTC_CNTL.WDTWPROTECT.raw = 0;

    RTC_CNTL.SWD_WPROTECT.raw = super_dogfood;
    RTC_CNTL.SWD_CONF.modify(.{ .SWD_DISABLE = 1 });
    RTC_CNTL.SWD_WPROTECT.raw = 0;

    INTERRUPT_CORE0.CPU_INT_ENABLE.raw = 0;

    microzig.hal.gpio.init(LED_PIN, .{
        .direction = .output,
        .direct_io = true,
    });

    microzig.hal.uart.write(0, "Hello from Zig!\r\n");

    while (true) {
        GPIO.OUT.modify(.{ .DATA_ORIG = (1 << LED_PIN) });
        microzig.hal.uart.write(0, "R");
        microzig.core.experimental.debug.busy_sleep(1_000_000);
    }
}

const LED_PIN = 14; // GPIO

