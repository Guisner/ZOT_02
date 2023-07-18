*&---------------------------------------------------------------------*
*& Report zot_02_internal_tables
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_02_internal_tables.

TYPES: BEGIN OF lty_material,
         matnr TYPE matnr, "Malzeme ID
         maktx TYPE maktx, "Malzeme Açıklaması
         matkl TYPE matkl, "Malzeme Grubu
         menge TYPE menge_d, "Miktar
         meins TYPE meins, "Miktar tipi
       END OF lty_material.

DATA: lt_material TYPE TABLE OF lty_material,
      ls_material TYPE lty_material.

*Bundan sonraki kısımlar tabloya veri ekleme yöntemleridir.
"APPEND
ls_material-matnr = '01'.
ls_material-maktx = 'Çekiç'.
ls_material-matkl = 'Hırdavat'.
ls_material-menge = 5.
ls_material-meins = 'PC'.
APPEND ls_material TO lt_material.

"BASE
lt_material = VALUE #( BASE lt_material ( matnr = '02'
                                          maktx = 'Tornivida'
                                          matkl = 'Hırdavat'
                                          menge = 10
                                          meins = 'PC' )
                                          ( matnr = '03'
                                          maktx = 'Bir şeyler'
                                          matkl = 'Hırdavat'
                                          menge = 10
                                          meins = 'PC' ) ).
"Yukarıda görüldüğü üzere 1'den fazla veri atanabilir.

"INSERT
ls_material-matnr = '03'.
ls_material-maktx = 'Lastik'.
ls_material-matkl = 'Hırdavat'.
ls_material-menge = 15.
ls_material-meins = 'PC'.
INSERT ls_material INTO TABLE lt_material.

"SORTED TABLE
"Sorted Table'lar belirli bir indexe sahip olduğu için daha hızlı okunuyor. Verilerin daha hızlı okunması için kullanılıyor.
DATA: lt_material_s TYPE SORTED TABLE OF lty_material WITH NON-UNIQUE KEY matnr.
lt_material_s = VALUE #( BASE lt_material_s ( matnr = ''
                                              maktx = 'Tornavida'
                                              matkl = 'Hırdavat'
                                              menge = 10
                                              meins = 'PC' ) ).

DATA: lv_matnr TYPE matnr.
DO 5 TIMES.
  lv_matnr += 1.
  ls_material-matnr = lv_matnr.
  ls_material-maktx = 'Çekiç'.
  ls_material-matkl = 'Hırdavat'.
  ls_material-menge = 6.
  ls_material-meins = 'PC'.
  APPEND ls_material TO lt_material.
  CLEAR: ls_material.

ENDDO.



"Bundan sonrası okuma kısmı oluyor.
"READ TABLE tablonun içerisinde spesifik olarak istenilen veriyi çekmek için şart ile belirlenerek çağırılmasını sağlar.
READ TABLE lt_material INTO ls_material WITH KEY maktx = 'Tornavida'.
IF sy-subrc EQ 0 .
  lt_material = VALUE #( BASE lt_material (
                         matnr = '99'
                         maktx = 'Kalem'
                         matkl = 'Kırtasiye'
                         menge = ls_material-menge
                         meins = ls_material-meins ) ) .



ENDIF.
