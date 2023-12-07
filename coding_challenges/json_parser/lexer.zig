// Performs tokenization (lexical analysis)
const std = @import("std");

pub const TokenType = enum { CurlyOpen, CurlyClose, SquareOpen, SquareClose, Comma, Colon, String, Number, True, False, Null };

pub const Token = struct {
    ttype: TokenType,
    value: ?[]const u8, // Optional value - not all tokens (e.g braces) have associated values
};

pub const Lexer = struct {
    input: []const u8,
    position: usize,

    pub fn init(input: []const u8) Lexer {
        return Lexer{
            .input = input,
            .position = 0,
        };
    }

    pub fn nextToken(self: *Lexer) ?Token {
        _ = self;
        // TODO
        return null;
    }
};
