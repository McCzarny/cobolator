IDENTIFICATION DIVISION.
    PROGRAM-ID. PARSECONFIG.
       
    ENVIRONMENT DIVISION.
    CONFIGURATION SECTION.
    SOURCE-COMPUTER.
    OBJECT-COMPUTER.

    INPUT-OUTPUT SECTION.
    FILE-CONTROL.

    DATA DIVISION.
    FILE SECTION.

    WORKING-STORAGE SECTION.
    01  WS-CURRENCY PIC X(3).
    01  WS-HOURLY-SALARY COMPUTATIONAL PIC 9(4)V99 VALUE 0.
    01  WS-VAT COMPUTATIONAL PIC 99 VALUE 0.
    01  WS-PAYMENT-DEADLINE COMPUTATIONAL PIC 99 VALUE 0.
    01  WS-ACCOUNT-NUMBER PIC 9(26).
    01  WS-BUSINESS.
           05 BUSINESS-NAME        PIC A(80).
           05 BUSINESS-STREET      PIC A(80).
           05 BUSINESS-CITY        PIC X(30).
           05 BUSINESS-POSTAL-CODE PIC A(6).
              
    PROCEDURE DIVISION.
    READ-XML-FILE  SECTION.
       DISPLAY "READ-XML-FILE"
       EXIT.
       