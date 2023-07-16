*&---------------------------------------------------------------------*
*& Report zot_02_fibonacci_kirilim
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_02_fibonacci_kirilim.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_val1 TYPE p,
              p_val2 TYPE p.

SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

  DATA: gv_max  TYPE i,
        gv_val2 TYPE i,
        gv_say1 TYPE i,
        gv_say2 TYPE i,
        gv_tmp  TYPE i.


  gv_max = p_val1.
  gv_val2 = p_val2.
  gv_say1 = 1.
  gv_say2 = 2.

  IF p_val1 IS INITIAL.
    cl_demo_output=>display( 'Maksimum Sayı kısmı boş bırakılamaz!' ).
  ELSEIF p_val2 IS INITIAL.
    cl_demo_output=>display( 'Kırılım Sayısı boş bırakılamaz!' ).
  ELSEIF p_val1 <= 0.
    cl_demo_output=>display( 'Maksimum sayı 0 veya 0dan küçük bir değer olamaz.' ).
  ELSEIF p_val2 <= 0.
    cl_demo_output=>display( 'Kırılım noktası 0 veya 0dan küçük bir değer olamaz.' ).
  ELSE.

    WHILE gv_say1 <= gv_max.
      WRITE: gv_say1.
      gv_tmp = gv_say1.
      gv_say1 = gv_say2.
      gv_say2 = gv_tmp + gv_say2.
      IF sy-index MOD gv_val2 = 0.
        WRITE:/.
      ENDIF.
    ENDWHILE.
  ENDIF.
