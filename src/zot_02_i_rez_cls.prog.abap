*&---------------------------------------------------------------------*
*& Include zot_02_i_rez_cls
*&---------------------------------------------------------------------*

CLASS lcl_main_controller DEFINITION CREATE PRIVATE FINAL.
  PUBLIC SECTION.

    CLASS-METHODS:
      "! Main controller get singleton object
      get_instance
        RETURNING
          VALUE(ro_instance) TYPE REF TO lcl_main_controller.

    METHODS: display_alv,
      register_f4.
*      set_dropdown.

  PRIVATE SECTION.
    CLASS-DATA:
      mo_instance              TYPE REF TO lcl_main_controller,
      mo_main_custom_container TYPE REF TO cl_gui_container,
      "! Main ALV grid
      mo_main_grid             TYPE REF TO cl_gui_alv_grid.

    METHODS handle_onf4
      FOR EVENT onf4 OF cl_gui_alv_grid
      IMPORTING
        e_fieldname
        e_fieldvalue
        es_row_no
        er_event_data
        et_bad_cells
        e_display.


ENDCLASS.

CLASS lcl_main_controller IMPLEMENTATION.

  METHOD get_instance.
    IF mo_instance IS INITIAL.
      mo_instance = NEW #( ).
    ENDIF.
    ro_instance = mo_instance.
  ENDMETHOD.


  METHOD display_alv.

    CREATE OBJECT go_cont1
      EXPORTING
        container_name = 'CC_ALV_REZ'.


    CREATE OBJECT go_cont2
      EXPORTING
        container_name = 'CC_ALV_REZ2'.

    CREATE OBJECT go_splitter
      EXPORTING
        parent  = go_cont1
        rows    = 2
        columns = 1.

    CALL METHOD go_splitter->get_container
      EXPORTING
        row       = 1
        column    = 1
      RECEIVING
        container = go_gui1.

    CALL METHOD go_splitter->get_container
      EXPORTING
        row       = 2
        column    = 1
      RECEIVING
        container = go_gui2.

    CREATE OBJECT go_alv
      EXPORTING
        i_parent = go_gui1. "Obje tanımlaması

    CALL METHOD register_f4.
    SET HANDLER handle_onf4 FOR go_alv.

    CREATE OBJECT go_alv2
      EXPORTING
        i_parent = go_gui2. "Obje tanımlaması

    CREATE OBJECT go_alv3
      EXPORTING
        i_parent = go_cont2. "Obje tanımlaması

    CLEAR ls_fieldcat.
    ls_fieldcat-fieldname = 'ID'.
    ls_fieldcat-scrtext_s = 'Yolcu ID'.
    ls_fieldcat-scrtext_m = 'Yolcu ID'.
    ls_fieldcat-scrtext_l = 'Yolcu ID'.
*    ls_fieldcat-ref_table = 'zot_02_t_tickets'.
    ls_fieldcat-edit = 'X'.
    APPEND ls_fieldcat TO lt_fieldcat.

    CLEAR ls_fieldcat.
    ls_fieldcat-fieldname = 'ID'.
    ls_fieldcat-scrtext_s = 'Kayıt ID'.
    ls_fieldcat-scrtext_m = 'Kayıt ID'.
    ls_fieldcat-scrtext_l = 'Kayıt ID'.
    APPEND ls_fieldcat TO lt_fcatdb.

*    CLEAR ls_fieldcat.
*    ls_fieldcat-fieldname = 'CARRID'.
*    ls_fieldcat-scrtext_s = 'Hav. Kodu'.
*    ls_fieldcat-scrtext_m = 'Havayolu Kodu'.
*    ls_fieldcat-scrtext_l = 'Havayolu Kodu'.
**    ls_fieldcat-ref_table = 'scarr'.
*    APPEND ls_fieldcat TO lt_fcatdb.
*    ls_fieldcat-auto_value = 'X'.
*    ls_fieldcat-edit = 'X'.
*    ls_fieldcat-drdn_hndl = 1.
*    APPEND ls_fieldcat TO lt_fieldcat.

    CLEAR ls_fieldcat.
    ls_fieldcat-fieldname = 'CARRNAME'.
    ls_fieldcat-scrtext_s = 'Hav. Adı'.
    ls_fieldcat-scrtext_m = 'Havayolları Adı'.
    ls_fieldcat-scrtext_l = 'Havayolları Adı'.
*    ls_fieldcat-ref_table = 'scarr'.
    APPEND ls_fieldcat TO lt_fcatdb.
    ls_fieldcat-edit = 'X'.
*    ls_fieldcat-f4availabl = 'X'.
    ls_fieldcat-style = cl_gui_alv_grid=>mc_style_f4.
    APPEND ls_fieldcat TO lt_fieldcat.

    CLEAR ls_fieldcat.
    ls_fieldcat-fieldname = 'NEREDEN'.
    ls_fieldcat-scrtext_s = 'Nereden'.
    ls_fieldcat-scrtext_m = 'Nereden'.
    ls_fieldcat-scrtext_l = 'Nereden'.
*    ls_fieldcat-ref_table = 'zot_02_t_tickets'.
    APPEND ls_fieldcat TO lt_fcatdb.
    ls_fieldcat-edit = 'X'.
    APPEND ls_fieldcat TO lt_fieldcat.

    CLEAR ls_fieldcat.
    ls_fieldcat-fieldname = 'NEREYE'.
    ls_fieldcat-scrtext_s = 'Nereye'.
    ls_fieldcat-scrtext_m = 'Nereye'.
    ls_fieldcat-scrtext_l = 'Nereye'.
*    ls_fieldcat-ref_table = 'zot_02_t_tickets'.
    APPEND ls_fieldcat TO lt_fcatdb.
    ls_fieldcat-edit = 'X'.
    APPEND ls_fieldcat TO lt_fieldcat.


    CALL METHOD go_alv->set_table_for_first_display
      EXPORTING
        i_structure_name = 'GTY_TABLE1'
      CHANGING
        it_fieldcatalog  = lt_fieldcat
        it_outtab        = lt_tableal1
      EXCEPTIONS
        OTHERS           = 1.


    CALL METHOD go_alv->register_edit_event
      EXPORTING
        i_event_id = cl_gui_alv_grid=>mc_evt_modified.


    CLEAR lt_fieldcat.
    CLEAR ls_fieldcat.
    ls_fieldcat-fieldname = 'ID'.
    ls_fieldcat-scrtext_s = 'Yolcu ID'.
    ls_fieldcat-scrtext_m = 'Yolcu ID'.
    ls_fieldcat-scrtext_l = 'Yolcu ID'.
*    ls_fieldcat-ref_table = 'zot_02_t_tickets'.
    ls_fieldcat-edit = 'X'.
    APPEND ls_fieldcat TO lt_fieldcat.

    CLEAR ls_fieldcat.
    ls_fieldcat-fieldname = 'PASSNAME'.
    ls_fieldcat-scrtext_s = 'Yolcu İsmi'.
    ls_fieldcat-scrtext_m = 'Yolcu İsmi'.
    ls_fieldcat-scrtext_l = 'Yolcu İsmi'.
*    ls_fieldcat-ref_table = 'zot_02_t_tickets'.
    APPEND ls_fieldcat TO lt_fcatdb.
    ls_fieldcat-edit = 'X'.
    APPEND ls_fieldcat TO lt_fieldcat.

    CLEAR ls_fieldcat.
    ls_fieldcat-fieldname = 'PASSSUR'.
    ls_fieldcat-scrtext_s = 'Yolcu Soyadı'.
    ls_fieldcat-scrtext_m = 'Yolcu Soyadı'.
    ls_fieldcat-scrtext_l = 'Yolcu Soyadı'.
*    ls_fieldcat-ref_table = 'zot_02_t_tickets'.
    APPEND ls_fieldcat TO lt_fcatdb.
    ls_fieldcat-edit = 'X'.
    APPEND ls_fieldcat TO lt_fieldcat.

    CLEAR ls_fieldcat.
    ls_fieldcat-fieldname = 'PASSAGE'.
    ls_fieldcat-scrtext_s = 'Yolcu Yaşı'.
    ls_fieldcat-scrtext_m = 'Yolcu Yaşı'.
    ls_fieldcat-scrtext_l = 'Yolcu Yaşı'.
*    ls_fieldcat-ref_table = 'zot_02_t_tickets'.
    APPEND ls_fieldcat TO lt_fcatdb.
    ls_fieldcat-edit = 'X'.
    APPEND ls_fieldcat TO lt_fieldcat.

    CLEAR ls_fieldcat.
    ls_fieldcat-fieldname = 'PASSBIRTH'.
    ls_fieldcat-scrtext_s = 'Yol. D. T.'.
    ls_fieldcat-scrtext_m = 'Yolcu Doğum Tarihi'.
    ls_fieldcat-scrtext_l = 'Yolcu Doğum Tarihi'.
*    ls_fieldcat-ref_table = 'zot_02_t_tickets'.
    APPEND ls_fieldcat TO lt_fcatdb.
    ls_fieldcat-edit = 'X'.
    APPEND ls_fieldcat TO lt_fieldcat.


    CALL METHOD go_alv2->set_table_for_first_display
      EXPORTING
        i_structure_name = 'GTY_TABLE2'
      CHANGING
        it_fieldcatalog  = lt_fieldcat
        it_outtab        = lt_tableal2
      EXCEPTIONS
        OTHERS           = 1.

    CALL METHOD go_alv2->register_edit_event
      EXPORTING
        i_event_id = cl_gui_alv_grid=>mc_evt_modified.

    SELECT * FROM zot_02_t_tickets INTO TABLE lt_dbtable.

    CLEAR lt_fieldcat.
    CALL METHOD go_alv3->set_table_for_first_display
      EXPORTING
        i_structure_name = 'GTY_TABLE3'
      CHANGING
        it_fieldcatalog  = lt_fcatdb
        it_outtab        = lt_dbtable
      EXCEPTIONS
        OTHERS           = 1.
    CLEAR lt_fcatdb.

    CALL METHOD go_alv3->register_edit_event
      EXPORTING
        i_event_id = cl_gui_alv_grid=>mc_evt_modified.

  ENDMETHOD.

*  METHOD set_dropdown.
*    DATA: lt_dropdown TYPE lvc_t_drop,
*          ls_dropdown TYPE lvc_s_drop.
*
*
*    Select * into table lt_scarr from SCARR.
*
*
**    LOOP AT lt_scarr INTO ls_scarr.
**    CLEAR : ls_dropdown.
**    ls_dropdown-handle = 1.
**    ls_dropdown-value = ls_scarr-carrid.
**    APPEND ls_dropdown TO lt_dropdown.
**    ENDLOOP.
*
*    LOOP AT lt_scarr INTO ls_scarr.
*    CLEAR : ls_dropdown.
*    ls_dropdown-handle = 2.
*    ls_dropdown-value = ls_scarr-carrname.
*    APPEND ls_dropdown TO lt_dropdown.
*    ENDLOOP.
*
*    go_alv->set_drop_down_table(
*      EXPORTING
*        it_drop_down       = lt_dropdown
*    ).

*  ENDMETHOD.

  METHOD handle_onf4.

    TYPES: BEGIN OF lty_valuetab,
             carrname TYPE s_carrname,
           END OF lty_valuetab.

    DATA: lt_valuetab TYPE TABLE OF lty_valuetab,
          ls_valuetab TYPE lty_valuetab.

    DATA: lt_returntab TYPE TABLE OF ddshretval,
          ls_returntab TYPE ddshretval.

    SELECT * INTO TABLE lt_scarr FROM scarr.

    LOOP AT lt_scarr INTO ls_scarr.
      CLEAR: ls_valuetab.
      ls_valuetab-carrname = ls_scarr-carrname.
      APPEND ls_valuetab TO lt_valuetab.
      CLEAR ls_scarr.
    ENDLOOP.

*  CLEAR: ls_valuetab.
*  ls_valuetab-carrname = 'Uçuş 1'.
*  APPEND ls_valuetab TO lt_valuetab.
*  CLEAR: ls_valuetab.
*  ls_valuetab-carrname = 'Uçuş 2'.
*  APPEND ls_valuetab TO lt_valuetab.
*  CLEAR: ls_valuetab.
*  ls_valuetab-carrname = 'Uçuş 3'.
*  APPEND ls_valuetab TO lt_valuetab.

*Bu fonksiyon belalı bir fonksiyonmuş ve internette insanların nasıl kullandığını araştırmalıyım.


    CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
      EXPORTING
        dynpprog        = sy-repid
        retfield        = 'CARRNAME' "CARRNAME Referans alınacak
        window_title    = 'Firma'
        value_org       = 'S'
      TABLES
        value_tab       = lt_valuetab
        return_tab      = lt_returntab
      EXCEPTIONS
        parameter_error = 1
        no_values_found = 2
        OTHERS          = 3.


    READ TABLE lt_returntab INTO ls_returntab WITH KEY fieldname = 'F0001'.
    IF sy-subrc EQ 0.
      READ TABLE lt_tableal1 ASSIGNING <gfs_scarr> INDEX es_row_no-row_id.
      IF sy-subrc EQ 0.
        <gfs_scarr>-carrname = ls_returntab-fieldval.

        go_alv->refresh_table_display( ).
      ENDIF.
    ENDIF.

    er_event_data->m_event_handled = 'X'.

  ENDMETHOD.

  METHOD register_f4.
    DATA: lt_f4 TYPE lvc_t_f4,
          ls_f4 TYPE lvc_s_f4.

    CLEAR ls_f4.
    ls_f4-fieldname = 'CARRNAME'.
    ls_f4-register = abap_true.
    ls_f4-getbefore = abap_true.
    ls_f4-chngeafter = abap_true.
    APPEND ls_f4 TO lt_f4.


    CALL METHOD go_alv->register_f4_for_fields
      EXPORTING
        it_f4 = lt_f4.

  ENDMETHOD.

ENDCLASS.

DATA:
  go_main TYPE REF TO lcl_main_controller.
