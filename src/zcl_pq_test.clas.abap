CLASS zcl_pq_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PQ_TEST IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    data(lv_string) = |VGVzdCBQUSBJdGVt|....

    " LV_ORIGINAL_XSTRING is of type XSTRING and contains the binary data encoded
    " in LV_string
    DATA(lv_original_xstring) = xco_cp=>string( lv_string
      )->as_xstring( xco_cp_binary=>text_encoding->base64
      )->value.

    DATA(lv_qitem_id) = cl_print_queue_utils=>create_queue_item_by_data( iv_qname            = 'DEFAULT'
                                                                         iv_print_data       = lv_original_xstring
                                                                         iv_name_of_main_doc = 'Test'
                                                                         iv_itemid = cl_print_queue_utils=>create_queue_itemid(  ) ).
    out->write( lv_qitem_id ).
  ENDMETHOD.
ENDCLASS.
