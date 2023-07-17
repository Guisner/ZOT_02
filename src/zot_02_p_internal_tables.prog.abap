*&---------------------------------------------------------------------*
*& Report zot_02_p_internal_tables
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_02_p_internal_tables.

TYPES: BEGIN OF lty_menge_collect,
matkl type matkl,
menge type menge_d,
END OF lty_menge_collect.

DATA: lt_material   TYPE TABLE OF zot_00_t_materia,
      lt_material_z TYPE TABLE OF zot_00_t_materia,
      lt_material_merge TYPE TABLE OF zot_00_t_materia,
      lt_material_toplam TYPE TABLE OF zot_00_t_materia,
      ls_material   TYPE zot_00_t_materia.

START-OF-SELECTION.

  SELECT *
  INTO TABLE lt_material_z
  FROM zot_00_t_materia.

  lt_material = VALUE #( BASE lt_material ( matnr = '01'
                                            maktx = 'Kilit'
                                            matkl = 'C'
                                            menge = 5
                                            meins = 'ST' )
                                            ( matnr = '02'
                                            maktx = 'Çivi'
                                            matkl = 'C'
                                            menge = 5
                                            meins = 'ST' )
                                            ( matnr = '03'
                                            maktx = 'Fener'
                                            matkl = 'C'
                                            menge = 5
                                            meins = 'ST' )
                                            ( matnr = '04'
                                            maktx = 'Çekiç'
                                            matkl = 'C'
                                            menge = 5
                                            meins = 'ST' )
                                            ( matnr = '05'
                                            maktx = 'Seramik'
                                            matkl = 'C'
                                            menge = 10
                                            meins = 'ST' ) ).

*Ölçü birimleri eşleşiyorsa z'li tabloyadaki menge alanına 10 ekleniyor.
  LOOP AT lt_material_z INTO DATA(ls_material_z_degistir).
    READ TABLE lt_material INTO DATA(ls_material_degistir) WITH KEY meins = ls_material_z_degistir-meins.
    IF sy-subrc EQ 0.
      ls_material_z_degistir-menge += 10.
      MODIFY lt_material_z FROM ls_material_z_degistir.
    ENDIF.
    CLEAR ls_material_z_degistir.
  ENDLOOP.

  "Birleştirmenin yapıldığı kısım.
  LOOP AT lt_material_z INTO DATA(ls_material_merge).
  APPEND ls_material_merge TO lt_material_merge.
  ENDLOOP.
  LOOP AT lt_material INTO DATA(ls_material_merge2).
  APPEND ls_material_merge2 TO lt_material_merge.
  ENDLOOP.

*matkl menge alanlarının toplamının saklandığı internal table.
DATA: lt_menge_collect TYPE table of lty_menge_collect.
DATA: ls_menge_collect TYPE lty_menge_collect.

      LOOP AT lt_material_merge INTO DATA(ls_menge).
      ls_menge_collect = VALUE #( matkl = ls_menge-matkl
                                  menge = ls_menge-menge ).

      collect ls_menge_collect INTO lt_menge_collect.
      CLEAR ls_menge_collect.
      ENDLOOP.

*İstenen silme işlemi
DELETE lt_material_merge WHERE menge < 10.

*Sıralamanın yapılması
SORT lt_material_merge BY menge ASCENDING.
SORT lt_menge_collect BY menge DESCENDING.

cl_demo_output=>display( lt_material_merge ).
cl_demo_output=>display( lt_menge_collect ).


END-OF-SELECTION.
