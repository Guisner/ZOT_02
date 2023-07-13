*&---------------------------------------------------------------------*
*& Report zot_02_p_twitter
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_02_p_twitter.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_val1 TYPE p,
              p_val2 TYPE char60.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  PARAMETERS:
    p_tw_at  RADIOBUTTON GROUP g1,
    p_tw_deg RADIOBUTTON GROUP g1,
    p_tw_sil RADIOBUTTON GROUP g1,
    p_tw_gtr RADIOBUTTON GROUP g1.

SELECTION-SCREEN END OF BLOCK b2.

DATA lt_main_modify TYPE TABLE OF zot_02_t_twitter.

START-OF-SELECTION.

  IF p_tw_at = abap_true.
    SELECT SINGLE COUNT( * )
     FROM zot_02_t_twitter
     WHERE tweet_id = p_val1.
    IF sy-subrc = 0.
      cl_demo_output=>display( 'Girdiğiniz Tweet ID zaten daha önceden oluşturulmuş. Varolan ID silinebilir ya da ilgili ID Tweet değiştirilebilir.' ).
    ELSE.
      APPEND VALUE #( tweet_id = p_val1
                    tweet = p_val2 ) TO lt_main_modify.
      MODIFY zot_02_t_twitter FROM TABLE lt_main_modify.
      cl_demo_output=>display( 'İşlem Başarılı!' ).
    ENDIF.

  ELSEIF p_tw_deg = abap_true.
    SELECT SINGLE COUNT( * )
       FROM zot_02_t_twitter
       WHERE tweet_id = p_val1.
    IF sy-subrc = 0.
      UPDATE zot_02_t_twitter SET tweet = p_val2
      WHERE tweet_id = p_val1.
      COMMIT WORK AND WAIT.
      cl_demo_output=>display( 'İşlem Başarılı!' ).
    ELSE.
      cl_demo_output=>display( 'Girdiğiniz ID ye sahip bir Tweet bulunmamaktadır.' ).
    ENDIF.

  ELSEIF p_tw_sil = abap_true.
    SELECT SINGLE COUNT( * )
       FROM zot_02_t_twitter
       WHERE tweet_id = p_val1.
    IF sy-subrc = 0.
      DELETE FROM zot_02_t_twitter WHERE tweet_id = p_val1.
      COMMIT WORK AND WAIT.
      cl_demo_output=>display( 'İşlem Başarılı!' ).
    ELSE.
      cl_demo_output=>display( 'Girdiğiniz ID ye sahip bir Tweet bulunmamaktadır.' ).
    ENDIF.

  ELSE.
    SELECT tweet
    FROM zot_02_t_twitter
    INTO TABLE @DATA(abapitter).
    IF sy-subrc = 0.
      cl_demo_output=>display( abapitter ).
    ELSE.
      WRITE :/ 'Error'.
    ENDIF.

  ENDIF.
