// Performs lexical analysis (tokenization)
const std = @import("std");
const ArrayList = std.ArrayList;

pub const TokenType = enum { CurlyOpen, CurlyClose };
const LexicalError = error{ UnknownToken, UndefinedToken };

pub const Token = struct { ttype: TokenType };

pub const Lexer = struct {
    input: []const u8,
    tokens: ArrayList(Token),
    allocator: *std.mem.Allocator,

    pub fn init(input: []const u8, allocator: *std.mem.Allocator) Lexer {
        return Lexer{
            .input = input,
            .allocator = allocator,
            .tokens = ArrayList(Token).init(allocator.*),
        };
    }

    fn nextToken(self: *Lexer, token: ?u8) !TokenType {
        _ = self;
        if (token) |value| {
            switch (value) {
                '{' => return TokenType.CurlyOpen,
                '}' => return TokenType.CurlyClose,
                else => return LexicalError.UnknownToken,
            }
        } else {
            return LexicalError.UndefinedToken;
        }
    }

    pub fn tokenize(self: *Lexer) !ArrayList(Token) {
        if (self.input.len == 0) {
            return LexicalError.UndefinedToken;
        }
        for (self.input) |token| {
            const tokenType = try self.nextToken(token);
            try self.tokens.append(Token{ .ttype = tokenType });
        }
        return self.tokens;
    }
};
