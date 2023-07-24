report file.


*&---------------------------------------------------------------------*
*& Report YTEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ytest.

TABLES: spfli.

SELECT-OPTIONS:
  s_carrid FOR spfli-carrid,
  s_connid FOR spfli-connid,
  s_countr FOR spfli-countryfr .

INITIALIZATION .

START-OF-SELECTION .

END-OF-SELECTION .
