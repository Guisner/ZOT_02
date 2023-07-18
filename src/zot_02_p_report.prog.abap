*&---------------------------------------------------------------------*
*& Report zot_02_p_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_02_p_report.

TABLES: eban, ekpo, likp.
INCLUDE zot_02_i_report_top.
INCLUDE zot_02_i_report_sel.
INCLUDE zot_02_i_report_cls.
INCLUDE zot_02_i_report_mdl.

INITIALIZATION.
  go_main = lcl_main_controller=>get_instance( ).


START-OF-SELECTION.

IF p_sat = abap_true.
  go_main->get_datasat( ).

  SELECT eban~banfn,
         eban~bnfpo,
         eban~bsart,
         eban~matnr,
         eban~menge,
         eban~meins
  FROM eban
  INNER JOIN ekpo ON ekpo~banfn = eban~banfn AND ekpo~matkl = eban~matkl
  WHERE eban~banfn IN @s_sat_id
  INTO TABLE @DATA(lt_sat).

  go_main->display_grid_sat( ).

ELSEIF p_sas = abap_true.
    go_main->get_datasas( ).

  SELECT ekpo~ebeln,
         ekpo~ebelp,
         ekpo~matnr,
         ekpo~menge,
         ekpo~meins
  FROM ekpo
  INNER JOIN eban ON ekpo~banfn = eban~banfn AND ekpo~matkl = eban~matkl
  WHERE ekpo~ebeln IN @s_sas_id
  INTO TABLE @DATA(lt_sas).

  go_main->display_grid_sas( ).

ENDIF.


END-OF-SELECTION.
