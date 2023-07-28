*&---------------------------------------------------------------------*
*& Include zot_02_i_sip_kirilim_top
*&---------------------------------------------------------------------*

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

DATA: gt_table TYPE TABLE OF gty_table,
      gs_table TYPE gty_table.

FIELD-SYMBOLS: <gfs_sqltab> TYPE STANDARD TABLE.

DATA: gs_fldcat TYPE slis_fieldcat_alv,
      gt_fldcat TYPE slis_t_fieldcat_alv,
      gs_sort   TYPE slis_sortinfo_alv,
      gt_sort   TYPE slis_t_sortinfo_alv,
      lv_where  TYPE string,
      lv_field  TYPE string,
      lv_value  TYPE string.

**TOP ın üstte kalması ve classlar daha tanımlanmadan burada kullanılması gerektiğinden
**Burada deferred kalıbını kullanarak class tanımlaması yapılabilir.
*CLASS lcl_main_controller DEFINITION DEFERRED.
*DATA: go_event_receiver TYPE REF TO lcl_main_controller.


*FIELD-SYMBOLS: <gfs_fcat> TYPE slis_t_fieldcat_alv.

DATA: gv_cbsayar TYPE i.
