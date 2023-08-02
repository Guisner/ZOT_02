*&---------------------------------------------------------------------*
*& Include zot_02_i_alv_frm
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form display_alv
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_alv .

*Container ile bağlamak için aşağıdaki kod kullanılabilir.
*  CREATE OBJECT go_cont
*    EXPORTING
*      container_name = 'CC_ALV'.
*
*  CREATE OBJECT go_alv
*    EXPORTING
*      i_parent = go_cont.

    CREATE OBJECT go_alv
      EXPORTING
        i_parent = cl_gui_container=>screen0.

    CALL METHOD go_alv->set_table_for_first_display
      EXPORTING
*       i_buffer_active  =
*       i_bypassing_buffer            =
*       i_consistency_check           =
        i_structure_name = 'GTY_TABLE'
*       is_variant       =
*       i_save           =
*       i_default        = 'X'
*       is_layout        =
*       is_print         =
*       it_special_groups             =
*       it_toolbar_excluding          =
*       it_hyperlink     =
*       it_alv_graphics  =
*       it_except_qinfo  =
*       ir_salv_adapter  =
      CHANGING
        it_outtab        = gt_table
*       it_fieldcatalog  =
*       it_sort          =
*       it_filter        =
*    EXCEPTIONS
*       invalid_parameter_combination = 1
*       program_error    = 2
*       too_many_lines   = 3
*       others           = 4
      .
    IF sy-subrc <> 0.
*   MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*     WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form get_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*

FORM get_data.
  TRY.
      SELECT vk~vbeln,
             vp~posnr,
             vk~ernam,
             vk~audat,
             vk~auart,
             vk~vkorg,
             tvk~vtext,
             vk~vtweg,
             vk~spart,
             vk~vkgrp,
             tvg~bezei,
             vk~vkbur,
             vk~gsber,
             vk~kunnr,
             kn~name1,
             vp~matnr,
             mk~maktx,
             mr~mtart,
             t1~mtbez,
             vp~pstyv,
             vp~netwr,
             vp~waerk,
             vp~charg,
             vp~smeng,
             vp~meins
        FROM vbak AS vk
        INNER JOIN vbap AS vp ON vk~vbeln = vp~vbeln
        LEFT JOIN tvkot AS tvk ON tvk~vkorg = vk~vkorg
        LEFT JOIN tvgrt AS tvg ON tvg~vkgrp = vk~vkgrp
        LEFT JOIN kna1 AS kn ON kn~kunnr = vk~kunnr
        LEFT JOIN makt AS mk ON mk~matnr = vp~matnr
        LEFT JOIN mara AS mr ON mr~matnr = vp~matnr
        LEFT JOIN t134t AS t1 ON t1~mtart = mr~mtart
        WHERE vk~vbeln IN @s_vbeln AND vk~ernam IN @s_ernam AND vk~audat IN @s_audat AND vk~vkorg IN @s_vkorg AND vk~vtweg IN @s_vtweg AND vk~spart IN @s_spart AND
        vk~vkgrp IN @s_vkgrp AND vk~vkbur IN @s_vkbur AND vk~gsber IN @s_gsber AND vk~kunnr IN @s_kunnr AND vp~matnr IN @s_matnr AND vp~charg IN @s_charg
        INTO TABLE @gt_table.

    CATCH cx_sy_open_sql_db.
      MESSAGE a001.


  ENDTRY.
ENDFORM.
