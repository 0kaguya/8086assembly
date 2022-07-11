TITLE   hello

DOSSEG
.MODEL  SMALL

.STACK  100h

.DATA

message         DB      "hello, world", 13, 10
lmessage        EQU     $ - message

.CODE

start:          mov     ax, @DATA
                mov     ds, ax

                mov     bx, 1
                mov     cx, lmessage
                mov     dx, OFFSET message
                mov     ax, 4000h
                int     21h

                mov     ax, 4C00h
                int     21h

END     start
