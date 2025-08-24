//usr/bin/env zig run "$0" -- "$@"; exit

//
//| Usage: {{_input_:script name}} [-h] [-p PROFILE] ARGS
//|
//|
//| Options:
//|   -p PROFILE     set PROFILE name.
//|   -h             show this message.
//|
//| Examples:
//|    $ {{_input_:script name}} -h
//|    $ {{_input_:script name}} $(hostname)
//|    $ {{_input_:script name}} -p DEBUG $(hostname)
//

const std = @import("std");
const print = std.debug.print;
const process = std.process;

const Config = struct {
    profile: ?[]const u8 = null,
    show_help: bool = false,
    args: [][]const u8 = &[_][]const u8{},
};

pub fn main() !void {
    // メモリアロケータの設定
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // 引数のパース
    const config = parseArgs(allocator) catch |err| {
        switch (err) {
            error.InvalidArgument => std.process.exit(1),
            else => return err,
        }
    };
    defer {
        if (config.profile) |p| allocator.free(p);
        for (config.args) |arg| allocator.free(arg);
        allocator.free(config.args);
    }

    // ヘルプ表示
    if (config.show_help) {
        usage();
        return;
    }

    // // 引数が必要な場合はコメントを外す
    // if (config.args.len == 0) {
    //     usage();
    //     std.process.exit(1);
    // }

    // メインロジックの実行
    try main_logic(config);
}

fn usage() void {
    // ソースファイルを読み込んでヘルプメッセージを表示
    const source = @embedFile(@src().file);
    var lines = std.mem.tokenize(u8, source, "\n");

    while (lines.next()) |line| {
        if (std.mem.startsWith(u8, line, "//|")) {
            print("{s}\n", .{line[3..]});
        }
    }
    print("\n", .{});
}

fn parseArgs(allocator: std.mem.Allocator) !Config {
    const args = try process.argsAlloc(allocator);
    defer process.argsFree(allocator, args);

    var config = Config{};
    var i: usize = 1; // Skip program name
    var remaining_args = std.ArrayList([]const u8).init(allocator);
    defer remaining_args.deinit();

    while (i < args.len) : (i += 1) {
        const arg = args[i];

        if (std.mem.eql(u8, arg, "-h")) {
            config.show_help = true;
            return config;
        } else if (std.mem.eql(u8, arg, "-p")) {
            if (i + 1 >= args.len) {
                print("Error: -p requires an argument\n\n", .{});
                usage();
                return error.InvalidArgument;
            }
            i += 1;
            config.profile = try allocator.dupe(u8, args[i]);
        } else if (std.mem.startsWith(u8, arg, "-")) {
            print("Error: Unknown option: {s}\n\n", .{arg});
            usage();
            return error.InvalidArgument;
        } else {
            try remaining_args.append(try allocator.dupe(u8, arg));
        }
    }

    config.args = try remaining_args.toOwnedSlice();
    return config;
}

fn main_logic(config: Config) !void {
    if (config.profile) |profile| {
        print("[{s}] ", .{profile});
    }

    print("Hello", .{});
    for (config.args) |arg| {
        print(", {s}", .{arg});
    }
    print("\n", .{});
}
