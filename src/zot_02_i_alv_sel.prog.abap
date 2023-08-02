*&---------------------------------------------------------------------*
*& Include zot_02_i_alv_sel
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS: s_vbeln FOR vbak-vbeln NO INTERVALS. "Sipariş No
  SELECT-OPTIONS: s_ernam FOR vbak-ernam NO INTERVALS. "Sipariş Veren
  SELECT-OPTIONS: s_audat FOR vbak-audat. "Belge Tarihi
  SELECT-OPTIONS: s_auart FOR vbak-auart. "Sipariş Türü
  SELECT-OPTIONS: s_vkorg FOR vbak-vkorg.
  SELECT-OPTIONS: s_vtweg FOR vbak-vtweg.
  SELECT-OPTIONS: s_spart FOR vbak-spart.
  SELECT-OPTIONS: s_vkgrp FOR vbak-vkgrp.
  SELECT-OPTIONS: s_vkbur FOR vbak-vkbur.
  SELECT-OPTIONS: s_gsber FOR vbak-gsber.
  SELECT-OPTIONS: s_kunnr FOR vbak-kunnr.
  SELECT-OPTIONS: s_matnr FOR vbap-matnr.
  SELECT-OPTIONS: s_charg FOR vbap-charg.
SELECTION-SCREEN END OF BLOCK b1.
