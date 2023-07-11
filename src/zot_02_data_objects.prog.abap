*&---------------------------------------------------------------------*
*& Report zot_02_data_objects
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_02_data_objects.

DATA: gv_ogrenci_adi(10) TYPE c, "predefined
      gv_ogrenci_soyadi  TYPE char12, "data element
      gv_tarih           TYPE sy-datum.

gv_ogrenci_adi = 'Alper'.
gv_ogrenci_soyadi = 'Birinci'.
gv_tarih = sy-datum.


cl_demo_output=>write( gv_ogrenci_adi ).
cl_demo_output=>write( gv_ogrenci_soyadi ).
cl_demo_output=>write( gv_tarih ).

TYPES: gty_char TYPE c LENGTH 50. "Tip tanımlama

DATA: gv_new TYPE gty_char.

DATA: gv_langu TYPE sy-langu.

gv_langu = sy-langu.

*ELSEIF
*IF gv_langu = 'T'.
*  cl_demo_output=>write('Merhaba Dünya').
*ELSEIF gv_langu EQ 'E'.
*  cl_demo_output=>write( 'Hello World' ).
*ELSE.
*  cl_demo_output=>write( 'Deneme' ).
*ENDIF.
*
*SWITCHCASE
*CASE gv_langu.
*  WHEN 'E'.
*    cl_demo_output=>write( 'Hello World' ).
*  WHEN 'T'.
*    cl_demo_output=>write( 'Merhaba Dünya' ).
*  WHEN OTHERS.
*    cl_demo_output=>write( 'Başka Dil Bilmiyorum' ).
*ENDCASE.
*
*
*DATA: gv_text1 TYPE char12.
*gv_text1 = 'Hello World'.
*
*DATA(gv_text2) = 'Hello World'. "Bu yöntemi daha çok kullanacağız
*DATA(gv_bugun) = sy-datum.
*
*DATA(lv_num) = strlen( gv_text2 ).
*
*DO lv_num TIMES.
*  cl_demo_output=>write( sy-index ).
*ENDDO.
*
*WHILE lv_num > 0.
*  cl_demo_output=>write( sy-index ).
*  lv_num = lv_num - 1.
*ENDWHILE.

""""""""""""""""""""""""""""""""""""""""""""""""""""""

*DATA: lv_number1 TYPE i VALUE 10,
*      lv_number2 TYPE i VALUE 5.
*
*DATA(lv_toplama) = lv_number1 + lv_number2.
*DATA(lv_cikarma) = lv_number1 - lv_number2.
*DATA(lv_carpma) = lv_number1 * lv_number2.
*DATA(lv_bolme) = lv_number1 / lv_number2.
*
*cl_demo_output=>write( |{ lv_number1 } + { lv_number2 } = { lv_toplama }| ).
*cl_demo_output=>write( |{ lv_number1 } - { lv_number2 } = { lv_cikarma }| ).
*cl_demo_output=>write( |{ lv_number1 } * { lv_number2 } = { lv_carpma }| ).
*cl_demo_output=>write( |{ lv_number1 } / { lv_number2 } = { lv_bolme }| ). "Burada niye düz çizgi kullanılıyor öğren?
*
*cl_demo_output=>write( |Clear işleminden önce lv_bolme'nin değeri: { lv_bolme }| ).
*CLEAR lv_bolme.
*cl_demo_output=>write( |Clear işleminden önce lv_bolme'nin değeri: { lv_bolme }| ).
*
*lv_number2 = 0.
*
*TRY.
*    lv_bolme = lv_number1 / lv_number2.
*
*  CATCH cx_sy_zerodivide.
*    cl_demo_output=>write( |Sıfıra bölme işlemi yapılamaz!| ).
*  CATCH cx_sy_arithmetic_overflow.
*    cl_demo_output=>write( |Aritmetik overflow| ).
*ENDTRY.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

**FUNCTION YAPISI
DATA: lv_number1 TYPE i VALUE 10,
      lv_number2 TYPE i VALUE 5,
      lv_op      TYPE c VALUE '/'.
*      lv_result  TYPE i.
*
*CALL FUNCTION 'ZOT_02_DO_MATH_OPS'
*  EXPORTING
*    iv_number1   = lv_number1
*    iv_number2   = lv_number2
*    iv_operation = lv_op
*  IMPORTING
*    ev_result    = lv_result.
**  EXCEPTIONS
**    cx_sy_zerodivide = 1.
**    cx_sy_assign_cast_error.
*
*cl_demo_output=>write( |{ lv_number1 } / { lv_number2 } = { lv_result }| ).



DATA(lo_math_op) = NEW zcl_ot_00_mat_ops( ).

lo_math_op->calculate_result(
  EXPORTING
    iv_number1   = lv_number1
    iv_number2   = lv_number2
    iv_operation = lv_op
  IMPORTING
    ev_result    = DATA(lv_result)
).



cl_demo_output=>write( |{ lv_number1 } - { lv_number2 } = { lv_result }| ).








cl_demo_output=>display(  ).
