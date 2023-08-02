*&---------------------------------------------------------------------*
*& Include zot_02_i_rez_top
*&---------------------------------------------------------------------*

TABLES: sbook, sflight, zot_02_t_tickets.

TYPES: BEGIN OF gty_table1,
       id TYPE numc3,
       carrid TYPE s_carr_id,
       carrname TYPE s_carrname,
       nereden TYPE zot_02_e_from,
       nereye TYPE zot_02_e_to,
       END OF gty_table1.

TYPES: BEGIN OF gty_table2,
       id TYPE numc3,
       passname TYPE s_passname,
       passage TYPE zot_02_e_passage,
       passbirth TYPE s_birthdat,
       END OF gty_table2.

TYPES: BEGIN OF gty_table3,
       id TYPE numc3,
       carrid TYPE s_carr_id,
       carrname TYPE s_carrname,
       nereden TYPE zot_02_e_from,
       nereye TYPE zot_02_e_to,
       passname TYPE s_passname,
       passage TYPE zot_02_e_passage,
       passbirth TYPE s_birthdat,
       END OF gty_table3.

DATA: go_alv TYPE REF TO cl_gui_alv_grid,
      go_alv2 TYPE REF TO cl_gui_alv_grid,
      go_alv3 TYPE REF TO cl_gui_alv_grid,
      go_cont1 TYPE REF TO cl_gui_custom_container,
      go_cont2 TYPE REF TO cl_gui_custom_container.

DATA: go_splitter TYPE REF TO cl_gui_splitter_container,
      go_splitter2 TYPE REF TO cl_gui_splitter_container,
      go_gui1 TYPE REF TO cl_gui_container,
      go_gui2 TYPE REF TO cl_gui_container,
      go_gui3 TYPE REF TO cl_gui_alv_grid.

DATA: ls_fieldcat TYPE lvc_s_fcat,
      lt_fieldcat TYPE lvc_t_fcat,
      lt_fcatdb TYPE lvc_t_fcat,
      ls_tableal1 TYPE gty_table1,
      lt_tableal1 TYPE TABLE OF gty_table1,
      ls_tableal2 TYPE gty_table2,
      lt_tableal2 TYPE TABLE OF gty_table2,
      lt_dbtable TYPE TABLE OF zot_02_t_tickets,
      ls_dbtable TYPE zot_02_t_tickets.
