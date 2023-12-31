// Performs syntactic analysis (parsing) on a stream of tokens
const std = @import("std");
const ArrayList = std.ArrayList;
const Token = @import("lexer.zig").Token;
const TokenType = @import("lexer.zig").TokenType;

pub const Parser = struct {
    tokens: ArrayList(Token),
    allocator: *std.mem.Allocator,

    pub fn init(allocator: *std.mem.Allocator) Parser {
        return Parser{
            .allocator = allocator,
            .tokens = ArrayList(Token).init(allocator.*),
        };
    }

    pub fn parse(self: *Parser, tokens: ArrayList(Token)) !bool {
        var curlyOpenList = ArrayList(Token).init(self.allocator.*);
        var curlyCloseList = ArrayList(Token).init(self.allocator.*);

        for (tokens.items) |inputToken| {
            try self.tokens.append(inputToken);
        }

        for (self.tokens.items) |token| {
            if (token.ttype == TokenType.CurlyOpen) {
                try curlyOpenList.append(token);
            }
            if (token.ttype == TokenType.CurlyClose) {
                try curlyCloseList.append(token);
            }
        }

        if (curlyOpenList.items.len == curlyCloseList.items.len) {
            return true;
        } else {
            return false;
        }
    }
};
