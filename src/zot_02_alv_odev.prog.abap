*&---------------------------------------------------------------------*
*& Report zot_02_alv_odev
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_02_alv_odev MESSAGE-ID zot_02_alv_msg_cl.

INCLUDE zot_02_i_alv_top.
INCLUDE zot_02_i_alv_sel.
INCLUDE zot_02_i_alv_pbo.
INCLUDE zot_02_i_alv_pai.
*INCLUDE zot_02_i_alv_cls.
INCLUDE zot_02_i_alv_frm.


START-OF-SELECTION.

  PERFORM get_data.
  IF lines( gt_table ) = 0.
    MESSAGE i000.

  ELSE.
    CALL SCREEN 0100.
  ENDIF.

END-OF-SELECTION.
