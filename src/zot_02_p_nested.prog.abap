*&---------------------------------------------------------------------*
*& Report zot_02_p_nested
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_02_p_nested.
    DATA(lt_table) = VALUE zot_02_TT_ORG_NOT( ( ogrenci_id        = '19071504'
                                                ogrenci_ad        = 'Alper Sonuncu'
                                                dog_tarihi       = '05/06/2001'
                                                ogr_bolumu = 'Yazılım Mühendisliği'
                                                ogr_notlar = VALUE zot_02_s_sinif(
                                                sinif1 = VALUE zot_02_s_ders(
                                                ders1 = VALUE zot_02_s_not(
                                                vize1 = '42'
                                                vize2 = '30'
                                                final = '40'
                                                btnleme = '75')
                                                ders2 = VALUE zot_02_s_not(
                                                vize1 = '70'
                                                vize2 = '35'
                                                final = '20'
                                                btnleme = '68') ) ) ) ).

cl_demo_output=>display( lt_table ).
