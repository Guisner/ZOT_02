*&---------------------------------------------------------------------*
*& Include zot_02_i_sip_kirilim_sel
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS: s_vbeln FOR vbak-vbeln. "Sipariş No
  SELECT-OPTIONS: s_kunnr FOR vbak-kunnr. "Sipariş Veren
  SELECT-OPTIONS: s_auart FOR vbak-auart. "Sipariş Türü
  SELECT-OPTIONS: s_audat FOR vbak-audat. "Belge Tarihi
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS: s_matnr FOR vbap-matnr. "Malzeme
  SELECT-OPTIONS: s_werks FOR vbap-werks. "Üretim Yeri
  SELECT-OPTIONS: s_pstyv FOR vbap-pstyv. "Kalem Tipi
  SELECT-OPTIONS: s_matkl FOR vbap-matkl. "Mal Grubu
  SELECT-OPTIONS: s_charg FOR vbap-charg. "Parti
SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-002.

  PARAMETERS:
    p_siptur AS CHECKBOX,
    p_malzno AS CHECKBOX,
    p_sipver AS CHECKBOX,
    p_malgrb AS CHECKBOX,
    p_parti  AS CHECKBOX.

SELECTION-SCREEN END OF BLOCK b3.
