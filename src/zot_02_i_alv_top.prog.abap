*&---------------------------------------------------------------------*
*& Include zot_02_i_alv_top
*&---------------------------------------------------------------------*

TABLES: vbak, vbap.

DATA: go_alv TYPE REF TO cl_gui_alv_grid,
      go_cont TYPE REF TO cl_gui_custom_container.

TYPES: BEGIN OF gty_table,
         vbeln TYPE vbeln,
         posnr TYPE posnr,
         ernam TYPE ernam,
         audat TYPE audat,
         auart TYPE auart,
         vkorg TYPE vkorg,
         vtext TYPE vtxtk,
         vtweg TYPE vtweg,
         spart TYPE spart,
         vkgrp TYPE vkgrp,
         bezei TYPE bezei,
         vkbur TYPE vkbur,
         gsber TYPE gsber,
         kunnr TYPE kunnr,
         name1 TYPE name1,
         matnr TYPE matnr,
         maktx TYPE maktx,
         mtart TYPE mtart,
         mtbez TYPE mtbez,
         pstyv TYPE pstyv,
         netwr TYPE netwr,
         waerk TYPE waerk,
         charg TYPE charg_d,
         smeng TYPE smeng,
         meins TYPE meins,
       END OF gty_table.

DATA: gt_table TYPE TABLE OF gty_table,
      gs_table TYPE gty_table.
