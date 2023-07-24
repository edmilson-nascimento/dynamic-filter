*&---------------------------------------------------------------------*
*& Report YTEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ytest.

TABLES:
  spfli.

DATA:
  lt_where TYPE texy_where .

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
    APPEND 'countr in s_countr' TO lt_where .
  ENDIF .

  IF ( lines( lt_where ) EQ 0 ) .
    RETURN .
  ENDIF.

  SELECT *
    FROM spfli
    INTO TABLE lt_data
   WHERE (lt_where) .

END-OF-SELECTION .
