*&---------------------------------------------------------------------*
*& Report zot_02_p_compare
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_02_p_compare.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_val1 TYPE char5 OBLIGATORY,
              p_val2 TYPE char5 OBLIGATORY,
              p_val3 TYPE char5 OBLIGATORY,
              p_val4 TYPE char5 OBLIGATORY,
              p_val5 TYPE char5 OBLIGATORY.

SELECTION-SCREEN END OF BLOCK b1.


TYPES: BEGIN OF gty_value,
         id    TYPE i,
         value TYPE char5,
       END OF gty_value.
DATA: ls_params TYPE gty_value,
      ls_new    TYPE gty_value.
DATA: lt_params TYPE TABLE OF gty_value.

DATA: lv_indx1 TYPE i,
      lv_indx2 TYPE i.

DATA(ls_table) = VALUE gty_value(  id = 1
                                   value = p_val1 ).
APPEND ls_table TO lt_params.
ls_table = VALUE gty_value(  id = 2
                                   value = p_val2 ).
APPEND ls_table TO lt_params.
ls_table = VALUE gty_value(  id = 3
                                   value = p_val3 ).
APPEND ls_table TO lt_params.
ls_table = VALUE gty_value(  id = 4
                                   value = p_val4 ).
APPEND ls_table TO lt_params.
ls_table = VALUE gty_value(  id = 5
                                   value = p_val5 ).
APPEND ls_table TO lt_params.

DATA: lv_blp1 TYPE bool VALUE abap_false,
      lv_blp2 TYPE bool VALUE abap_false,
      lv_blp3 TYPE bool VALUE abap_false,
      lv_blp4 TYPE bool VALUE abap_false,
      lv_blp5 TYPE bool VALUE abap_false,
      lv_compare TYPE bool VALUE abap_false.

START-OF-SELECTION.

lv_indx1 = 1.
LOOP AT lt_params INTO ls_table.

IF lv_indx1 = 1 AND lv_blp1 = abap_false.
WRITE: p_val1.
lv_blp1 = abap_true.
ENDIF.
IF lv_indx1 = 2 AND lv_blp2 = abap_false.
WRITE: p_val2.
lv_blp2 = abap_true.
ENDIF.
IF lv_indx1 = 3 AND lv_blp3 = abap_false.
WRITE: p_val3.
lv_blp3 = abap_true.
ENDIF.
IF lv_indx1 = 4 AND lv_blp4 = abap_false.
WRITE: p_val4.
lv_blp4 = abap_true.
ENDIF.
IF lv_indx1 = 5 AND lv_blp5 = abap_false.
WRITE: p_val5.
lv_blp5 = abap_true.
ENDIF.
LOOP AT lt_params INTO ls_new.
    IF ls_table-value CO ls_new-value AND ls_new-value CO ls_table-value AND ls_table-id NE ls_new-id.
        CASE ls_new-id.
        WHEN 1.
        IF lv_blp1 = abap_false.
        WRITE: | - { ls_new-value }|.
        ENDIF.
        lv_blp1 = abap_true.
        WHEN 2.
        IF lv_blp2 = abap_false.
        WRITE: | - { ls_new-value }|.
        ENDIF.
        lv_blp2 = abap_true.
        WHEN 3.
        IF lv_blp3 = abap_false.
        WRITE: | - { ls_new-value }|.
        ENDIF.
        lv_blp3 = abap_true.
        WHEN 4.
        IF lv_blp4 = abap_false.
        WRITE: | - { ls_new-value }|.
        ENDIF.
        lv_blp4 = abap_true.
        WHEN 5.
        IF lv_blp5 = abap_false.
        WRITE: | - { ls_new-value }|.
        ENDIF.
        lv_blp5 = abap_true.
        ENDCASE.
    ENDIF.
ENDLOOP.
WRITE: /.
lv_indx1 += 1.
ENDLOOP.

END-OF-SELECTION.
