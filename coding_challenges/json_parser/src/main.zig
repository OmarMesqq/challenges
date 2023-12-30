const std = @import("std");
const Lexer = @import("lexer.zig").Lexer;
const Parser = @import("parser.zig").Parser;

const AppErrors = error{ InsufficientArgumentsError, TooManyArgumentsError };

pub fn main() !void {
    const args = try std.process.argsAlloc(std.heap.page_allocator);
    defer std.heap.page_allocator.free(args);

    if (args.len != 2) {
        std.debug.print("Usage: {s} <filename>\n", .{args[0]});
        if (args.len < 2) {
            return error.InsufficientArguments;
        }
        if (args.len > 2) {
            return error.TooManyArgumentsError;
        }
    }

    const filename = args[1];
    std.debug.print("Filename: {s}\n", .{filename});

    const file = try std.fs.cwd().openFile(filename, .{
        .mode = .read_only, // create an anonymous struct on the fly
    });
    defer file.close();

    const file_stat = try file.stat();
    const file_size = file_stat.size;

    var buffer = try std.heap.page_allocator.alloc(u8, file_size);
    defer std.heap.page_allocator.free(buffer);

    const reader = file.reader();
    _ = try reader.read(buffer);

    const fileContents = std.mem.sliceTo(buffer, 0); // search the buffer until null terminator
    std.debug.print("File Contents: {s}\n", .{fileContents});
}
