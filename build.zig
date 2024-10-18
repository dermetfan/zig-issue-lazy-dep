const std = @import("std");

pub fn build(b: *std.Build) !void {
    const options = .{
        .target = b.standardTargetOptions(.{}),
        .optimize = b.standardOptimizeOption(.{}),
    };

    _ = b.addModule("a", .{
        .root_source_file = b.path("main.zig"),
        .imports = &.{
            .{
                .name = "b",
                .module = b.dependency("b", options).module("b"),
            },

            // Not needed to trigger the bug:
            // .{
            //     .name = "c",
            //     .module = b.dependency("c", options).module("c"),
            // },
        },
    });
}
