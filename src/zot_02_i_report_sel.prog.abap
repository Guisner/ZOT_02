*&---------------------------------------------------------------------*
*& Include zot_02_i_report_sel
*&---------------------------------------------------------------------*
DATA: gs_sat TYPE gty_sat,
      gs_sas TYPE gty_sas,
      gt_sat TYPE TABLE OF gty_sat,
      gt_sas TYPE TABLE OF gty_sas.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS: s_sat_id FOR eban-banfn.
  SELECT-OPTIONS: s_sat_in for eban-bnfpo.
  SELECT-OPTIONS: s_sas_id FOR ekpo-ebeln.
  SELECT-OPTIONS: s_sas_in FOR ekpo-bnfpo.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-002.

  PARAMETERS:
    p_sat RADIOBUTTON GROUP g1,
    p_sas RADIOBUTTON GROUP g1.

SELECTION-SCREEN END OF BLOCK b3.
