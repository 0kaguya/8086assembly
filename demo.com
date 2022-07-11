                TITLE   hello
_TEXT           SEGMENT
                ASSUME  cs:_TEXT, ds:_TEXT, ss:_TEXT
                ORG     100h

start:          mov     bx, 1
                mov     cx, lmessage
                mov     dx, OFFSET message
                mov     ax, 4000h
                int     21h

                mov     ax, 4C00h
                int     21h

message         DB      "hello, world", 13, 10
lmessage        EQU     $ - message

_TEXT           ENDS
                END     start
