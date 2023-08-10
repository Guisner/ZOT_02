*&---------------------------------------------------------------------*
*& Include zot_02_i_rez_pai
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN '&BACK'.
      SET SCREEN 0.
    WHEN '&ISLE'.
      LOOP AT lt_tableal1 INTO DATA(wa_tableal1).

        ls_dbtable-id = |{ wa_tableal1-id }-{ wa_tableal1-carrid }|.
        ls_dbtable-carrid = wa_tableal1-carrid.
        ls_dbtable-carrname = wa_tableal1-carrname.
        ls_dbtable-nereden = wa_tableal1-nereden.
        ls_dbtable-nereye = wa_tableal1-nereye.
        ls_dbtable-tarih = wa_tableal1-tarih.
        ls_dbtable-classf = wa_tableal1-classf.
        ls_dbtable-order_date = wa_tableal1-order_date.
        ls_dbtable-luggweight = wa_tableal1-luggweight.
        ls_dbtable-wunit = wa_tableal1-wunit.

        READ TABLE lt_tableal2 INTO DATA(wa_tableal2) WITH KEY id = wa_tableal1-id.

        IF sy-subrc = 0.
          ls_dbtable-passname = wa_tableal2-passname.
          ls_dbtable-passage = wa_tableal2-passage.
          ls_dbtable-passbirth = wa_tableal2-passbirth.

*          cl_demo_output=>display( ls_dbtable ).
          INSERT zot_02_t_tickets FROM ls_dbtable.
          APPEND ls_dbtable TO lt_dbtable.
          CLEAR ls_dbtable.
        ENDIF.
      ENDLOOP.
*      CALL METHOD go_alv->check_changed_data.



      IF go_alv3 IS NOT INITIAL.

        CALL METHOD go_alv3->check_changed_data.
        go_alv3->refresh_table_display( ).
        CALL METHOD go_alv3->set_visible
          EXPORTING
            visible = ''.
      ENDIF.

  ENDCASE.
ENDMODULE.
