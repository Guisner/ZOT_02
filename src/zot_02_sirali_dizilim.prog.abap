*&---------------------------------------------------------------------*
*& Report zot_02_sirali_dizilim
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_02_sirali_dizilim.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_val1 TYPE p,
              p_val2 TYPE p.

SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

  DATA: gv_val1 TYPE i,
        gv_val2 TYPE i,
        gv_say  TYPE i.

  gv_val1 = p_val1.
  gv_val2 = p_val2.
  gv_say = 0.

  IF p_val1 IS INITIAL.
    cl_demo_output=>display( 'Maksimum Sayı kısmı boş bırakılamaz!' ).
  ELSEIF p_val2 IS INITIAL.
    cl_demo_output=>display( 'Kırılım Sayısı boş bırakılamaz!' ).
  ELSEIF p_val1 <= 0.
    cl_demo_output=>display( 'Maksimum sayı 0 veya 0dan küçük bir değer olamaz.' ).
  ELSEIF p_val2 <= 0.
    cl_demo_output=>display( 'Kırılım noktası 0 veya 0dan küçük bir değer olamaz.' ).
  ELSE.
    DO gv_val1 TIMES.
      IF gv_say MOD gv_val2 = 0.
        WRITE:/.
      ENDIF.
      gv_say += 1.
      WRITE: gv_say.
    ENDDO.
  ENDIF.
