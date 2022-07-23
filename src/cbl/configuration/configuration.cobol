IDENTIFICATION DIVISION.
    PROGRAM-ID. PARSECONFIG.
       
    ENVIRONMENT DIVISION.
    CONFIGURATION SECTION.
    SOURCE-COMPUTER.
    OBJECT-COMPUTER.

    INPUT-OUTPUT SECTION.
    FILE-CONTROL.
       SELECT CONFIG-FILE ASSIGN TO WS-FILE-NAME
       ORGANIZATION IS LINE SEQUENTIAL.            


    DATA DIVISION.
    FILE SECTION.
    FD CONFIG-FILE.
    01 CONFIG-ENTRY-FILE.
       05 CONFIG-KEY PIC A(12).
       05 CONFIG-VALUE PIC X(25).

    WORKING-STORAGE SECTION.
    01  WS-GENERAL.
           05  WS-CURRENCY PIC X(3).
           05  WS-HOURLY-SALARY COMPUTATIONAL PIC 9(4)V99 VALUE 0.
           05  WS-VAT COMPUTATIONAL PIC 99 VALUE 0.
           05  WS-PAYMENT-DEADLINE COMPUTATIONAL PIC 99 VALUE 0.
           05  WS-ACCOUNT-NUMBER PIC 9(26).
    01  WS-BUSINESS.
           05 BUSINESS-NAME        PIC A(80).
           05 BUSINESS-STREET      PIC A(80).
           05 BUSINESS-CITY        PIC X(30).
           05 BUSINESS-POSTAL-CODE PIC A(6).
           05 BUSINESS-NIP         PIC 9(10).
    01 WS-CONFIG-ENTRY-FILE.
       05 WS-CONFIG-KEY PIC A(8).
       05 WS-CONFIG-DELIMITER PIC A(1).
       05 WS-CONFIG-VALUE PIC X(64).
    01 WS-EOF PIC A(1). 
                                                                        
    LINKAGE SECTION.
    01  WS-FILE-NAME PIC X(100).          
    PROCEDURE DIVISION USING WS-FILE-NAME.
    READ-CONFIG-FILE  SECTION.
       DISPLAY "READ-CONFIG-FILE"
       DISPLAY "FILENAME: " WS-FILE-NAME

          OPEN INPUT CONFIG-FILE.
             PERFORM UNTIL WS-EOF='Y'
                READ CONFIG-FILE INTO WS-CONFIG-ENTRY-FILE
                   AT END MOVE 'Y' TO WS-EOF
                END-READ
               IF NOT WS-EOF = 'Y' THEN
                   DISPLAY "KEY: " WS-CONFIG-KEY " VALUE: " WS-CONFIG-VALUE
                    EVALUATE WS-CONFIG-KEY
                    WHEN 'SARYHRLY'
                       MOVE WS-CONFIG-VALUE TO WS-HOURLY-SALARY
                    WHEN 'CURRENCY'
                       MOVE WS-CONFIG-VALUE TO WS-CURRENCY
                    WHEN 'VATRATE_'
                       MOVE WS-CONFIG-VALUE TO WS-VAT
                    WHEN 'PAYDEDLN'
                       MOVE WS-CONFIG-VALUE TO WS-PAYMENT-DEADLINE
                    WHEN 'ACCNUMBR'
                       MOVE WS-CONFIG-VALUE TO WS-ACCOUNT-NUMBER
                    WHEN 'FROMNAME'
                       MOVE WS-CONFIG-VALUE TO BUSINESS-NAME
                    WHEN 'FROMSTRT'
                       MOVE WS-CONFIG-VALUE TO BUSINESS-STREET
                    WHEN 'FROMCITY'
                       MOVE WS-CONFIG-VALUE TO BUSINESS-CITY
                    WHEN 'FROMPCOD'
                       MOVE WS-CONFIG-VALUE TO BUSINESS-POSTAL-CODE
                    WHEN 'FROMNIPN'
                       MOVE WS-CONFIG-VALUE TO BUSINESS-NIP
                    END-EVALUATE
               END-IF
             END-PERFORM.
               DISPLAY "GENERAL: " WS-GENERAL
               DISPLAY "FROM BUSINESS: " WS-BUSINESS                                    
          CLOSE CONFIG-FILE.


       EXIT.
      