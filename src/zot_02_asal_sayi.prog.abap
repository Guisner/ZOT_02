*&---------------------------------------------------------------------*
*& Report zot_02_asal_sayi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_02_asal_sayi.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_val1 TYPE p,
              p_val2 TYPE p.

SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

  DATA: gv_val1 TYPE i,
        gv_val2 TYPE i,
        gv_ind1 TYPE i,
        gv_ind2 TYPE i,
        gv_asal TYPE bool.

  gv_val1 = p_val1.
  gv_ind1 = gv_val1.
  gv_val2 = p_val2.


  IF p_val1 IS INITIAL.
    cl_demo_output=>display( 'İlk sayı kısmı boş bırakılamaz!' ).
  ELSEIF p_val2 IS INITIAL.
    cl_demo_output=>display( 'Son sayı kısmı boş bırakılamaz!' ).
  ELSEIF p_val1 <= 0.
    cl_demo_output=>display( 'İlk sayı 0 veya 0dan küçük bir değer olamaz.' ).
  ELSEIF p_val2 <= 0.
    cl_demo_output=>display( 'Son sayı 0 veya 0dan küçük bir değer olamaz.' ).
  ELSEIF p_val1 > p_val2.
    cl_demo_output=>display( 'İlk sayı son sayıdan küçük olamaz.' ).
  ELSE.
    WHILE gv_ind1 <= gv_val2.
      gv_ind2 = 2.
      gv_asal = abap_true.

      WHILE gv_ind2 < gv_ind1.
        IF gv_ind1 MOD gv_ind2 = 0.
          gv_asal = abap_false.
        ENDIF.
        gv_ind2 += 1.
      ENDWHILE.
      IF gv_asal = abap_true AND gv_ind1 NE 1.
        WRITE: gv_ind1.
        WRITE:/.
      ENDIF.
      gv_ind1 += 1.

    ENDWHILE.

  ENDIF.
