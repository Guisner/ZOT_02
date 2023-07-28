*&---------------------------------------------------------------------*
*& Include zot_02_i_sip_kirilim_cls
*&---------------------------------------------------------------------*

CLASS lcl_main_controller DEFINITION CREATE PRIVATE FINAL.
  PUBLIC SECTION.
    CLASS-METHODS:
      "! Main controller get singleton object
      get_instance
        RETURNING
          VALUE(ro_instance) TYPE REF TO lcl_main_controller.

    METHODS:
      get_data,
      set_alv,
      display_alv.


  PRIVATE SECTION.
    CLASS-DATA:
      mo_instance TYPE REF TO lcl_main_controller.

ENDCLASS.

FORM user_command USING p_ucomm  TYPE sy-ucomm
                       selfield TYPE slis_selfield.
  CASE p_ucomm.
    WHEN '&IC1'.
    cl_demo_output=>display( selfield ).
    IF selfield-fieldname EQ 'NETWR'.
    CONCATENATE selfield-fieldname ' EQ '  selfield-value  INTO DATA(lv_where1).
      SELECT vbak~vbeln,
               vbak~kunnr,
               vbak~bname,
               vbak~auart,
               vbak~augru,
               vbak~audat,
               vbap~matnr,
               vbap~arktx,
               vbap~charg,
               vbap~meins,
               vbap~netwr,
               vbap~waerk,
               vbap~werks,
               vbap~lgort
               FROM vbak JOIN vbap ON vbak~vbeln = vbap~vbeln
               INTO TABLE @DATA(lt_sql1)
               WHERE (lv_where1).
      cl_demo_output=>display( lt_sql1 ).
    ELSE.
      CONCATENATE selfield-fieldname ' EQ '  '''' selfield-value '''' INTO DATA(lv_where2).
      SELECT vbak~vbeln,
               vbak~kunnr,
               vbak~bname,
               vbak~auart,
               vbak~augru,
               vbak~audat,
               vbap~matnr,
               vbap~arktx,
               vbap~charg,
               vbap~meins,
               vbap~netwr,
               vbap~waerk,
               vbap~werks,
               vbap~lgort
               FROM vbak JOIN vbap ON vbak~vbeln = vbap~vbeln
               INTO TABLE @DATA(lt_sql2)
               WHERE (lv_where2).
      cl_demo_output=>display( lt_sql2 ).
      ENDIF.
  ENDCASE.
ENDFORM.


CLASS lcl_main_controller IMPLEMENTATION.
  METHOD get_instance.
    IF mo_instance IS INITIAL.
      mo_instance = NEW #( ).
    ENDIF.
    ro_instance = mo_instance.
  ENDMETHOD.

  METHOD get_data.

    SELECT vbak~vbeln,
         vbak~kunnr,
         vbak~auart,
         vbak~audat,
         vbap~matnr,
         vbap~werks,
         vbap~pstyv,
         vbap~matkl,
         vbap~charg,
         vbap~netwr,
         vbap~waerk
         FROM vbak
         INNER JOIN vbap ON vbak~vbeln = vbap~vbeln
         WHERE vbak~vbeln IN @s_vbeln AND vbak~kunnr IN @s_kunnr AND vbak~auart IN @s_auart AND
         vbak~audat IN @s_audat AND vbap~matnr IN @s_matnr AND vbap~werks IN @s_werks AND
         vbap~pstyv IN @s_pstyv AND vbap~matkl IN @s_matkl AND vbap~charg IN @s_charg
         INTO TABLE @gt_table.

  ENDMETHOD.

  METHOD set_alv.

    gv_cbsayar = 0.

    IF p_siptur = 'X'.
      gv_cbsayar += 1.
      gs_fldcat-fieldname = 'AUART'.
      gs_fldcat-seltext_s = 'Sipariş Türü'.
      APPEND gs_fldcat TO gt_fldcat.

      gs_sort-fieldname = 'AUART'.
      gs_sort-up = 'X'.
      APPEND gs_sort TO gt_sort.
    ENDIF.

    IF p_malzno = 'X'.
      CLEAR gs_sort.
      gv_cbsayar += 1.
      gs_fldcat-fieldname = 'MATNR'.
      gs_fldcat-seltext_s = 'Malzeme Numarası'.

      APPEND gs_fldcat TO gt_fldcat.

      gs_sort-fieldname = 'MATNR'.
      gs_sort-up = 'X'.
      IF gv_cbsayar = 2.
        gs_sort-subtot = 'X'.
        gs_sort-expa = 'X'.
      ENDIF.
      APPEND gs_sort TO gt_sort.
    ENDIF.


    IF p_sipver = 'X'.
      gv_cbsayar += 1.
      gs_fldcat-fieldname = 'KUNNR'.
      gs_fldcat-seltext_s = 'Sipariş Veren'.

      APPEND gs_fldcat TO gt_fldcat.

      gs_sort-fieldname = 'KUNNR'.
      gs_sort-up = 'X'.
      IF gv_cbsayar = 2.
        gs_sort-subtot = 'X'.
        gs_sort-expa = 'X'.
      ENDIF.
      APPEND gs_sort TO gt_sort.
    ENDIF.

    IF p_malgrb = 'X'.
      gv_cbsayar += 1.
      gs_fldcat-fieldname = 'MATKL'.
      gs_fldcat-seltext_s = 'Mal Grubu'.

      APPEND gs_fldcat TO gt_fldcat.

      gs_sort-fieldname = 'MATKL'.
      gs_sort-up = 'X'.
      IF gv_cbsayar = 2.
        gs_sort-subtot = 'X'.
        gs_sort-expa = 'X'.
      ENDIF.
      APPEND gs_sort TO gt_sort.
    ENDIF.

    IF p_parti = 'X'.
      gv_cbsayar += 1.
      gs_fldcat-fieldname = 'CHARG'.
      gs_fldcat-seltext_s = 'Parti'.

      APPEND gs_fldcat TO gt_fldcat.

      gs_sort-fieldname = 'CHARG'.
      gs_sort-up = 'X'.
      IF gv_cbsayar = 2.
        gs_sort-subtot = 'X'.
        gs_sort-expa = 'X'.
      ENDIF.
      APPEND gs_sort TO gt_sort.
    ENDIF.


    CLEAR gs_fldcat.
    gs_fldcat-fieldname = 'NETWR'.
    gs_fldcat-seltext_s = 'Net Değer'.
    gs_fldcat-do_sum = 'X'.
    APPEND gs_fldcat TO gt_fldcat.

    CLEAR gs_fldcat.
    gs_fldcat-fieldname = 'WAERK'.
    gs_fldcat-seltext_s = 'Para Birimi'.
    APPEND gs_fldcat TO gt_fldcat.

  ENDMETHOD.

*  METHOD handle_double_click.
*
*  ENDMETHOD.


  METHOD display_alv.


*  İki checkboxın seçilip seçilmediğinin kontrolü.
    IF gv_cbsayar NE 2.
      WRITE: |{ gv_cbsayar } seçili kutu var. 2 Kutucuğun işaretlenmesi gerekmektedir.|.
    ELSE.
      CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
        EXPORTING
*         i_interface_check       = space
*         i_bypassing_buffer      = space
*         i_buffer_active         = space
          i_callback_program      = sy-repid
*         i_callback_pf_status_set    = space
          i_callback_user_command = 'USER_COMMAND'
*         i_callback_top_of_page  = space
*         i_callback_html_top_of_page = space
*         i_callback_html_end_of_list = space
*         i_structure_name        =
*         i_background_id         =
*         i_grid_title            =
*         i_grid_settings         =
*         is_layout               =
          it_fieldcat             = gt_fldcat
*         it_excluding            =
*         it_special_groups       =
          it_sort                 = gt_sort
*         it_filter               =
*         is_sel_hide             =
*         i_default               = 'X'
*         i_save                  = space
*         is_variant              =
*         it_events               =
*         it_event_exit           =
*         is_print                =
*         is_reprep_id            =
*         i_screen_start_column   = 0
*         i_screen_start_line     = 0
*         i_screen_end_column     = 0
*         i_screen_end_line       = 0
*         i_html_height_top       = 0
*         i_html_height_end       = 0
*         it_alv_graphics         =
*         it_hyperlink            =
*         it_add_fieldcat         =
*         it_except_qinfo         =
*         ir_salv_fullscreen_adapter  =
*         o_previous_sral_handler =
*  IMPORTING
*         e_exit_caused_by_caller =
*         es_exit_caused_by_user  =
        TABLES
          t_outtab                = gt_table
*  EXCEPTIONS
*         program_error           = 1
*         others                  = 2
        .
      IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*   WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
      ENDIF.
    ENDIF.

  ENDMETHOD.

ENDCLASS.


DATA:
  go_main TYPE REF TO lcl_main_controller.
