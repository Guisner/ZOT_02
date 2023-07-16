*&---------------------------------------------------------------------*
*& Report zot_02_p_zmn
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_02_p_zmn.

DATA: lt_zmn TYPE TABLE OF zot_02_t_zmn.
DATA: ls_zmn TYPE  zot_02_t_zmn.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

SELECT-OPTIONS s_id FOR ls_zmn-indx.

SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

SELECT *
      INTO TABLE lt_zmn
      FROM zot_02_t_zmn
      WHERE indx IN s_id.

LOOP AT lt_zmn INTO ls_zmn.

    DATA: tarih   TYPE dats,
          tarih2  TYPE dats,
          gv_fark TYPE i.

    DATA: saat1    TYPE tims,
          saat2    TYPE tims,
          saatfark TYPE i.

    DATA: gv_yil  TYPE i,
          gv_ay   TYPE i,
          gv_gun  TYPE i,
          gv_saat TYPE i,
          gv_dak  TYPE i,
          gv_san  TYPE i.


    tarih = ls_zmn-bslgctah.
    tarih2 = ls_zmn-bitistah.
    saat1 = ls_zmn-baslsaat.
    saat2 = ls_zmn-bitssaat.

    gv_fark = tarih2 - tarih.
    saatfark = saat2 - saat1.

WRITE: | { ls_zmn-indx }. INDEX AIT KAYITTA; |.
    IF tarih > tarih2.
*İlk tarih ikinci tarihten büyük olursa yanlış uygulama yapıldığının bilgisi döndürülür.
      WRITE: 'İlk tarih ikinci tarihten büyük olamaz.'.
    ELSEIF tarih = tarih2 AND saat1 > saat2.
*Eğer günler aynıysa ama saat olarak bakıldığında ikinci tarih birinci tarihten büyükse:
      WRITE: 'İlk tarih ikini tarihten büyük olamaz.'.
    ELSEIF tarih = tarih2 AND saat1 = saat2.
*Zaman aynıysa:
      WRITE: 'Zaman farkı yoktur.'.
    ELSE.
      IF saat1 > saat2.
        gv_fark -= 1.
        saatfark = 86400 - saat1 + saat2.
      ELSE.
        saatfark = saat2 - saat1.
      ENDIF.
    ENDIF.

*Yıl, ay ve günün bulunduğu kısım.
    gv_yil = gv_fark DIV 365.
    gv_fark = gv_fark MOD 365.
    gv_ay = gv_fark DIV 30.
    gv_fark = gv_fark MOD 365.
    gv_gun = gv_fark MOD 30.

*Saatin bulunduğu kısım.
    gv_san = saatfark MOD 60.
    gv_dak = saatfark / 60 MOD 60.
    gv_saat = saatfark / 3600.

*Yazdırılmanın yapıldığı kısım.

IF gv_yil NE 0.
WRITE: | { gv_yil } YIL|.
ENDIF.
IF gv_ay NE 0.
WRITE: | { gv_ay } AY|.
ENDIF.
IF gv_gun NE 0.
WRITE: | { gv_gun } GÜN|.
ENDIF.
IF gv_saat NE 0.
WRITE: | { gv_saat } SAAT|.
ENDIF.
IF gv_dak NE 0.
WRITE: | { gv_dak } DAKİKA|.
ENDIF.
IF gv_san NE 0.
WRITE: | { gv_san } SANİYE|.
ENDIF.
WRITE: /.

ENDLOOP.

END-OF-SELECTION.
