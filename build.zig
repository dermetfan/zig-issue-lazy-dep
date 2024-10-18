const std = @import("std");

pub fn build(b: *std.Build) void {
    const options = .{
        .target = b.standardTargetOptions(.{}),
        .optimize = b.standardOptimizeOption(.{}),
    };

    const exe = b.addExecutable(.{
        .name = "a",
        .root_source_file = b.path("main.zig"),
        .target = options.target,
        .optimize = options.optimize,
    });
    exe.root_module.addImport("b", b.dependency("b", options).module("b"));
    exe.root_module.addImport("utils", b.dependency("utils", options).module("utils"));
    b.installArtifact(exe);
}
