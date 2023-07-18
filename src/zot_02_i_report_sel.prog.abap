*&---------------------------------------------------------------------*
*& Include zot_02_i_report_sel
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS: s_sat_id FOR eban-banfn,
                  s_sas_id FOR ekpo-ebeln.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  PARAMETERS:
    p_sat RADIOBUTTON GROUP g1,
    p_sas RADIOBUTTON GROUP g1.

SELECTION-SCREEN END OF BLOCK b2.
