const std = @import("std");

pub fn build(b: *std.Build) !void {
    const options = .{
        .target = b.standardTargetOptions(.{}),
        .optimize = b.standardOptimizeOption(.{}),
    };

    _ = b.addModule("b", .{
        .root_source_file = b.path("main.zig"),
        .target = options.target,
        .optimize = options.optimize,
        .imports = &.{
            // This should use `lazyDependency()` according to the error message:
            .{
                .name = "zqlite",
                .module = b.dependency("zqlite", options).module("zqlite"),
            },
        },
    });
}
