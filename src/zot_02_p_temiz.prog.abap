*&---------------------------------------------------------------------*
*& Report zot_02_p_temiz
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_02_p_temiz.


TABLES: vbak, vbap.

TYPES: BEGIN OF gty_table,
         vbeln TYPE vbeln,
         kunnr TYPE kunnr,
         auart TYPE auart,
         audat TYPE audat,
         matnr TYPE matnr,
         werks TYPE werks,
         pstyv TYPE pstyv,
         matkl TYPE matkl,
         charg TYPE charg_d,
         netwr TYPE netwr,
         waerk TYPE waerk,
       END OF gty_table.

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

DATA: gv_cbsayar TYPE i,
      gv_deger1  TYPE p,
      gv_deger2  TYPE p.

DATA: gt_table  TYPE TABLE OF gty_table,
      gt_newtable TYPE REF TO data,
      gs_newline TYPE REF TO data,
      gs_table  TYPE gty_table,
      gt_result LIKE gt_table.

DATA: ls_fldcat TYPE LVC_S_FCAT,"slis_t_fieldcat_alv,
      lt_fldcat TYPE LVC_T_FCAT.

FIELD-SYMBOLS: <lt_dyntable> TYPE STANDARD TABLE,
               <ls_dyntable> TYPE any.

SELECT vbak~vbeln,
       vbak~kunnr,
       vbak~auart,
       vbak~audat,
       vbap~matnr,
*       vbap~werks,
       vbap~pstyv,
       vbap~matkl,
       vbap~charg,
*       vbap~netwr,
       vbap~waerk
       FROM vbak
       INNER JOIN vbap ON vbak~vbeln = vbap~vbeln
       WHERE vbak~vbeln IN @s_vbeln AND vbak~kunnr IN @s_kunnr AND vbak~auart IN @s_auart AND
       vbak~audat IN @s_audat AND vbap~matnr IN @s_matnr AND vbap~werks IN @s_werks AND
       vbap~pstyv IN @s_pstyv AND vbap~matkl IN @s_matkl AND vbap~charg IN @s_charg
       INTO TABLE @gt_table.


START-OF-SELECTION.
  gv_cbsayar = 0.

  IF p_siptur = 'X'.
    gv_cbsayar += 1.
    gv_deger1 = vbak-auart.
  ENDIF.

  IF p_malzno = 'X'.
    gv_cbsayar += 1.
    IF gv_deger1 IS INITIAL.
      gv_deger1 = vbap-matnr.
    ELSE.
      gv_deger2 = vbap-matnr.
    ENDIF.
  ENDIF.

  IF p_sipver = 'X'.
    gv_cbsayar += 1.
    IF gv_deger1 IS INITIAL.
      gv_deger1 = vbak-kunnr.
    ELSEIF gv_deger2 IS INITIAL.
      gv_deger2 = vbak-kunnr.
    ENDIF.
  ENDIF.

  IF p_malgrb = 'X'.
    gv_cbsayar += 1.
    IF gv_deger1 IS INITIAL.
      gv_deger1 = vbap-matkl.
    ELSEIF gv_deger2 IS INITIAL.
      gv_deger2 = vbap-matkl.
    ENDIF.
  ENDIF.

  IF p_parti = 'X'.
    gv_cbsayar += 1.
    IF gv_deger1 IS INITIAL.
      gv_deger1 = vbap-charg.
    ELSEIF gv_deger2 IS INITIAL.
      gv_deger2 = vbap-charg.
    ENDIF.
  ENDIF.

*İki checkboxın seçilip seçilmediğinin kontrolü.
  IF gv_cbsayar NE 2.
    WRITE: |{ gv_cbsayar } seçili kutu var. En fazla 2 kutucuk işaretleyebilirsiniz.|.
  ELSE.

CLEAR gt_newtable.
CALL METHOD cl_alv_table_create=>create_dynamic_table
EXPORTING
it_fieldcatalog = lt_fldcat
IMPORTING
ep_table = gt_newtable.

ASSIGN gt_newtable->* TO <lt_dyntable>.
CREATE DATA gs_newline LIKE LINE OF <lt_dyntable>.

ASSIGN gs_newline->* TO <ls_dyntable>.


*   LOOP AT gt_table INTO gs_table
*   GROUP BY gs_table-auart.
*   ENDLOOP.
  ENDIF.


*IF p_siptur = 'X'.
*        IF p_malzno = 'X'.
*
*        ELSEIF p_sipver = 'X'.
*
*        ELSEIF p_malgrb = 'X'.
*
*        ELSEIF p_parti = 'X'.
*
*        ENDIF.
*     ELSEIF p_malzno = 'X'.
*     "
*        IF p_sipver = 'X'.
*        "
*        ELSEIF p_malgrb = 'X'.
*        "
*        ELSEIF p_parti = 'X'.
*        "
*        ENDIF.
*     ELSEIF p_sipver = 'X'.
*        "
*        IF p_malgrb = 'X'.
*        "
*        ELSEIF p_parti = 'X'.
*        "
*        ENDIF.
*     ELSE.
*     "
*     ENDIF.
END-OF-SELECTION.
