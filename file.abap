*&---------------------------------------------------------------------*
*& Report YTEST
*&---------------------------------------------------------------------*
REPORT ytest.

TABLES:
  spfli.

DATA:
  lt_data  TYPE spfli_tab,
  lt_where TYPE texy_where.

SELECT-OPTIONS:
  s_carrid FOR spfli-carrid,
  s_connid FOR spfli-connid,
  s_countr FOR spfli-countryfr .

INITIALIZATION .

START-OF-SELECTION .

  IF ( lines( s_carrid ) GT 0 ) .
    APPEND 'carrid in s_carrid' TO lt_where .
  ENDIF .

  IF ( lines( s_connid ) GT 0 ) .
    IF ( lines( lt_where ) GT 0 ) .
      APPEND 'and' TO lt_where .
    ENDIF .
    APPEND 's_connid in s_carrid' TO lt_where .
  ENDIF .

  IF ( lines( s_countr ) GT 0 ) .
    IF ( lines( lt_where ) GT 0 ) .
      APPEND 'and' TO lt_where .
    ENDIF .
    APPEND 'countryfr in s_countr' TO lt_where .
  ENDIF .

  IF ( lines( lt_where ) EQ 0 ) .
    RETURN .
  ENDIF.

  TRY .
      SELECT *
        FROM spfli
        INTO TABLE lt_data
       WHERE (lt_where) .
    CATCH cx_sy_dynamic_osql_semantics INTO DATA(excep).
      MESSAGE i000(>0) WITH excep->get_text( ).
  ENDTRY .

END-OF-SELECTION .

  IF ( lines( lt_data ) EQ 0 ) .
    RETURN .
  ENDIF .

  cl_demo_output=>display( lt_data ) .