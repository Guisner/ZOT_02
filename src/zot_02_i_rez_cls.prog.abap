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

    METHODS: display_alv.

  PRIVATE SECTION.
    CLASS-DATA:
      mo_instance              TYPE REF TO lcl_main_controller,
      mo_main_custom_container TYPE REF TO cl_gui_custom_container,
      "! Main ALV grid
      mo_main_grid             TYPE REF TO cl_gui_alv_grid.

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
    APPEND ls_fieldcat TO lt_fcatdb.
    ls_fieldcat-edit = 'X'.
    APPEND ls_fieldcat TO lt_fieldcat.

    CLEAR ls_fieldcat.
    ls_fieldcat-fieldname = 'CARRID'.
    ls_fieldcat-scrtext_s = 'Hav. Kodu'.
    ls_fieldcat-scrtext_m = 'Havayolu Kodu'.
    ls_fieldcat-scrtext_l = 'Havayolu Kodu'.
*    ls_fieldcat-ref_table = 'scarr'.
    APPEND ls_fieldcat TO lt_fcatdb.
    ls_fieldcat-edit = 'X'.
    APPEND ls_fieldcat TO lt_fieldcat.

    CLEAR ls_fieldcat.
    ls_fieldcat-fieldname = 'CARRNAME'.
    ls_fieldcat-scrtext_s = 'Hav. Adı'.
    ls_fieldcat-scrtext_m = 'Havayolları Adı'.
    ls_fieldcat-scrtext_l = 'Havayolları Adı'.
*    ls_fieldcat-ref_table = 'scarr'.
    APPEND ls_fieldcat TO lt_fcatdb.
    ls_fieldcat-edit = 'X'.
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


  ENDMETHOD.

ENDCLASS.

DATA:
  go_main TYPE REF TO lcl_main_controller.
