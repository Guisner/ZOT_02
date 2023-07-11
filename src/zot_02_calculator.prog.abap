*&---------------------------------------------------------------------*
*& Report zot_02_calculator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_02_calculator.



SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_val1 TYPE p DECIMALS 2,
              p_val2 TYPE p DECIMALS 2.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  PARAMETERS:
    p_topla  RADIOBUTTON GROUP g1,
    p_cikart RADIOBUTTON GROUP g1,
    p_carp   RADIOBUTTON GROUP g1,
    p_bol    RADIOBUTTON GROUP g1.

SELECTION-SCREEN END OF BLOCK b2.

DATA: gv_sonuc TYPE p DECIMALS 2.

IF p_topla = abap_true.
  gv_sonuc = p_val1 + p_val2.
  cl_demo_output=>write( gv_sonuc ).
ELSEIF p_cikart = abap_true.
  gv_sonuc = p_val1 - p_val2.
  cl_demo_output=>write( gv_sonuc ).
ELSEIF p_carp = abap_true.
  gv_sonuc = p_val1 * p_val2.
  cl_demo_output=>write( gv_sonuc ).
ELSE.
  TRY.
      gv_sonuc = p_val1 / p_val2.
      cl_demo_output=>write( gv_sonuc ).
    CATCH cx_sy_zerodivide.
      cl_demo_output=>write( |Sıfıra bölme işlemi yapılamaz!| ).
  ENDTRY.
ENDIF.

cl_demo_output=>display(  ).
