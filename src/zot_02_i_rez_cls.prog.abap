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
             set_dropdown.

  PRIVATE SECTION.
    CLASS-DATA:
      mo_instance              TYPE REF TO lcl_main_controller,
      mo_main_custom_container TYPE REF TO cl_gui_container,
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



    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name       = 'ZOT_02_S_REZERVASYON'
        i_bypassing_buffer     = abap_true
      CHANGING
        ct_fieldcat            = lt_fieldcat
      EXCEPTIONS
        inconsistent_interface = 1
        program_error          = 2
        OTHERS                 = 3.

    LOOP AT lt_fieldcat ASSIGNING FIELD-SYMBOL(<lfs_001>).
      IF <lfs_001> IS ASSIGNED.
        CASE <lfs_001>-fieldname.
          WHEN 'ID'.
            <lfs_001>-edit = 'X'.
            <lfs_001>-scrtext_s = 'Yolcu ID'.
            <lfs_001>-scrtext_m = 'Yolcu ID'.
            <lfs_001>-scrtext_l = 'Yolcu ID'.
            <lfs_001>-outputlen = 6.
          WHEN 'CARRID'.
            <lfs_001>-edit = 'X'.
          WHEN 'CARRNAME'.
*            <lfs_001>-edit = 'X'.
            APPEND <lfs_001> TO lt_fcatdb.
          WHEN 'NEREDEN'.
            <lfs_001>-edit = 'X'.
            <lfs_001>-auto_value = 'X'.
            <lfs_001>-outputlen = 10.
            APPEND <lfs_001> TO lt_fcatdb.
          WHEN 'NEREYE'.
            <lfs_001>-edit = 'X'.
            <lfs_001>-auto_value = 'X'.
            <lfs_001>-outputlen = 10.
            APPEND <lfs_001> TO lt_fcatdb.
          WHEN 'TARIH'.
            <lfs_001>-edit = 'X'.
            APPEND <lfs_001> TO lt_fcatdb.
          WHEN 'CLASSF'.
            <lfs_001>-edit = 'X'.
            <lfs_001>-coltext = 'Class'.
            <lfs_001>-scrtext_s = 'Class'.
            <lfs_001>-scrtext_m = 'Class'.
            <lfs_001>-scrtext_l = 'Class'.
            <lfs_001>-outputlen = 12.
            APPEND <lfs_001> TO lt_fcatdb.
            <lfs_001>-drdn_hndl = 1.
          WHEN 'ORDER_DATE'.
            <lfs_001>-edit = 'X'.
            APPEND <lfs_001> TO lt_fcatdb.
          WHEN 'LUGGWEIGHT'.
            <lfs_001>-edit = 'X'.
            APPEND <lfs_001> TO lt_fcatdb.
          WHEN 'WUNIT'.
            <lfs_001>-edit = 'X'.
            APPEND <lfs_001> TO lt_fcatdb.
        ENDCASE.
      ENDIF.
    ENDLOOP.

    set_dropdown( ).

    CALL METHOD go_alv->set_table_for_first_display
      EXPORTING
        i_structure_name = 'ZOT_02_S_REZERVASYON'
      CHANGING
        it_fieldcatalog  = lt_fieldcat
        it_outtab        = lt_tableal1
      EXCEPTIONS
        OTHERS           = 1.

    CALL METHOD go_alv->register_edit_event
      EXPORTING
        i_event_id = cl_gui_alv_grid=>mc_evt_modified.


    CLEAR lt_fieldcat.

    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name       = 'ZOT_02_S_YOLCU'
        i_bypassing_buffer     = abap_true
      CHANGING
        ct_fieldcat            = lt_fieldcat
      EXCEPTIONS
        inconsistent_interface = 1
        program_error          = 2
        OTHERS                 = 3.

    LOOP AT lt_fieldcat ASSIGNING FIELD-SYMBOL(<lfs_002>).
      IF <lfs_002> IS ASSIGNED.
        CASE <lfs_002>-fieldname.
          WHEN 'ID'.
            <lfs_002>-edit = 'X'.
            <lfs_002>-scrtext_s = 'Yolcu ID'.
            <lfs_002>-scrtext_m = 'Yolcu ID'.
            <lfs_002>-scrtext_l = 'Yolcu ID'.
            <lfs_002>-outputlen = 6.
            APPEND <lfs_002> TO lt_fcatdb.
          WHEN 'PASSNAME'.
            <lfs_002>-edit = 'X'.
            <lfs_002>-col_pos = 25.
            APPEND <lfs_002> TO lt_fcatdb.
          WHEN 'PASSAGE'.
            <lfs_002>-edit = 'X'.
            <lfs_002>-scrtext_s = 'Yaş'.
            <lfs_002>-scrtext_m = 'Yaş'.
            <lfs_002>-scrtext_l = 'Yaş'.
            <lfs_002>-col_pos = 26.
            APPEND <lfs_002> TO lt_fcatdb.
          WHEN 'PASSBIRTH'.
            <lfs_002>-scrtext_s = 'Doğum Tar.'.
            <lfs_002>-scrtext_m = 'Doğum Tarihi'.
            <lfs_002>-scrtext_l = 'Doğum Tarihi'.
            <lfs_002>-edit = 'X'.
            <lfs_002>-col_pos = 27.
            APPEND <lfs_002> TO lt_fcatdb.
        ENDCASE.
      ENDIF.
    ENDLOOP.

    CALL METHOD go_alv2->set_table_for_first_display
      EXPORTING
        i_structure_name = 'ZOT_02_S_YOLCU'
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

  METHOD set_dropdown.
    DATA: lt_dropdown TYPE lvc_t_drop,
          ls_dropdown TYPE lvc_s_drop.

    CLEAR : ls_dropdown.
    ls_dropdown-handle = 1.
    ls_dropdown-value = 'Economy Class'.
    APPEND ls_dropdown TO lt_dropdown.
    CLEAR : ls_dropdown.
    ls_dropdown-handle = 1.
    ls_dropdown-value = 'Business Class'.
    APPEND ls_dropdown TO lt_dropdown.
    CLEAR : ls_dropdown.
    ls_dropdown-handle = 1.
    ls_dropdown-value = 'First Class'.
    APPEND ls_dropdown TO lt_dropdown.

    go_alv->set_drop_down_table(
      EXPORTING
        it_drop_down       = lt_dropdown
    ).
  ENDMETHOD.

ENDCLASS.


DATA:
  go_main TYPE REF TO lcl_main_controller.
