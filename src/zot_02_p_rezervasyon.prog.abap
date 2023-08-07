*&---------------------------------------------------------------------*
*& Report zot_02_p_rezervasyon
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_02_p_rezervasyon.

INCLUDE zot_02_i_rez_top.
INCLUDE zot_02_i_rez_cls.

INITIALIZATION.
  go_main = lcl_main_controller=>get_instance( ).

INCLUDE zot_02_i_rez_pbo.
INCLUDE zot_02_i_rez_pai.

START-OF-SELECTION.

CALL SCREEN 0100.
