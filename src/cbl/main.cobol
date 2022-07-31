IDENTIFICATION DIVISION.
PROGRAM-ID. COBOLATOR.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
01 WS-RETURN-CODE PIC 9 VALUE 0.

01 WS-CONFIGURATION.
       05 WS-COMMAND-LINE pic x(100).
       05  WS-GENERAL.
           06  WS-CURRENCY PIC X(3).
           06  WS-HOURLY-SALARY PIC 9(4)V99 VALUE 0.
           06  WS-VAT PIC 99 VALUE 0.
           06  WS-PAYMENT-DEADLINE PIC 99 VALUE 0.
           06  WS-ACCOUNT-NUMBER PIC 9(26).
       05  WS-BUSINESS OCCURS 2 TIMES INDEXED BY IDX-1.
           06 BUSINESS-NAME        PIC A(80).
           06 BUSINESS-STREET      PIC A(80).
           06 BUSINESS-CITY        PIC X(30).
           06 BUSINESS-POSTAL-CODE PIC A(6).
           06 BUSINESS-NIP         PIC 9(10).
       05  WS-INDEX-FROM COMPUTATIONAL PIC 9 VALUE 1.
       05  WS-INDEX-TO   COMPUTATIONAL PIC 9 VALUE 2.

PROCEDURE DIVISION.
    ACCEPT WS-COMMAND-LINE FROM command-line
    DISPLAY 'Hello, I am Cobolator!'
    DISPLAY 'Command line args: ' WS-COMMAND-LINE
    CALL "PARSECONFIG" USING WS-CONFIGURATION.
    DISPLAY 'End of parsing.'.
    DISPLAY 'Account number: ' WS-ACCOUNT-NUMBER.
    DISPLAY 'Salary: ' WS-HOURLY-SALARY.
    DISPLAY 'VAT: ' WS-VAT.
    DISPLAY 'Payment deadline: ' WS-PAYMENT-DEADLINE.

    STOP RUN.
    