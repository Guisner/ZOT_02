*&---------------------------------------------------------------------*
*& Report zot_02_p_sip_kirilim
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_02_p_sip_kirilim.

INCLUDE zot_02_i_sip_kirilim_top.
INCLUDE zot_02_i_sip_kirilim_sel.
INCLUDE zot_02_i_sip_kirilim_cls.
*INCLUDE zot_02_i_sip_kirilim_mdl.

INITIALIZATION.
  go_main = lcl_main_controller=>get_instance( ).


START-OF-SELECTION.

go_main->get_data( ).
go_main->set_alv( ).
go_main->display_alv( ).
