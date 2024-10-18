const std = @import("std");

pub fn build(b: *std.Build) !void {
    const options = .{
        .target = b.standardTargetOptions(.{}),
        .optimize = b.standardOptimizeOption(.{}),
    };

    _ = b.addModule("c", .{
        .root_source_file = b.path("main.zig"),
        .target = options.target,
        .optimize = options.optimize,
        .imports = &.{
            // Not needed to trigger the bug:
            // .{
            //     .name = "zqlite",
            //     .module = (b.lazyDependency("zqlite", .{
            //         .target = options.target,
            //         .optimize = options.optimize,
            //     }) orelse return).module("zqlite"),
            // },
        },
    });
}
