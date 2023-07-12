*&---------------------------------------------------------------------*
*& Report zot_02_abap_dictionary
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_02_abap_dictionary.
*
*TYPES: BEGIN OF lty_personel,
*         id        TYPE zot_02_e_id,
*         ad        TYPE zot_02_e_ad,
*         yas       TYPE zot_02_e_yas,
*         departman TYPE zot_02_e_departman,
*         unvan     TYPE zot_02_e_unvan,
*       END OF lty_personel.
**Üst kısım structure tipi.
*
*DATA: "ls_personel_1 TYPE lty_personel, "1. Gün öğretilen structure yöntemi.
*  ls_personel_2 TYPE zot_02_s_personel, "2. Gün öğretilen, her yerde kullanılabilecek structure yapısı. INTERNAL TABLE
*  lt_personel   TYPE TABLE OF zot_02_s_personel. "Bu kısımda ise Local bir Table oluşturuluyor.INTERNAL TABLE
**      ls_personel_n TYPE zot_02_tt_personel,
*      lt_personel_n TYPE TABLE OF zot_02_tt_personel. "Tablonun tipinde tablo oluşturmak.

*    DATA(lt_ekip) = VALUE zot_02_tt_ekip.
*
DATA(lt_personel) = VALUE zot_02_tt_personel(
( id = 1
  ad = 'Alper Birinci'
  yas = 22
  departman = 'ABAP'
  unvan = 'Stajyer'
  ekip = VALUE zot_02_tt_ekip( ( id = 2
                                 ad = 'Yusuf Yük' )
                               ( id = 3
                                 ad = 'Mustafa Bir' ) ) ) ).

BREAK otabirinci.


*Dün öğretilen structure local ve çok kod içerisinde çok daha yer kaplayan bir yer iken
*bugün öğretilen çok daha az yer kaplıyor ve globaldir yani her yerde kullanılabilir.
