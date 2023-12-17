// Performs syntactic analysis on a stream of tokens
const std = @import("std");
const Lexer = @import("lexer.zig").Lexer;
const Token = @import("lexer.zig").Token;

pub const Parser = struct {
    lexer: *Lexer,
    current_token: ?Token,

    pub fn init(lexer: *Lexer) Parser {
        return Parser{
            .lexer = lexer,
            .current_token = lexer.nextToken(),
        };
    }

    pub fn parse(self: *Parser) void {
        _ = self;
        // TODO
        return;
    }
};
