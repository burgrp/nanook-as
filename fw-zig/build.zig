const std = @import("std");
const microzig = @import("vendor/espressif-esp/deps/microzig/build.zig");

pub const chips = @import("vendor/espressif-esp/src/chips.zig");

pub fn build(b: *std.build.Builder) void {
    //const optimize = b.standardOptimizeOption(.{});

    var exe = microzig.addEmbeddedExecutable(b, .{
        .name = "firmware",
        .source_file = .{
            .path = "blinky.zig",
        },
        .backing = .{ .chip = chips.esp32_c3 },
        //.optimize = optimize,
    });
    exe.install();
}
