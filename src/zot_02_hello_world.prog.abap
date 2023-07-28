*&---------------------------------------------------------------------*
*& Report zot_02_hello_world
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_02_hello_world.

WRITE: 'Hello World.'.

DATA: lv_a TYPE char4 VALUE 'abcd'.

IF 'AAAAA' CO 'ABCDE'.
WRITE: lv_a+1(1).
ELSE.
WRITE: 'hayır.'.
ENDIF.
