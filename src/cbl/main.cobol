IDENTIFICATION DIVISION.
PROGRAM-ID. COBOLATOR.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
01 WS-COMMAND-LINE pic x(100).

PROCEDURE DIVISION.
    ACCEPT WS-COMMAND-LINE FROM command-line
    DISPLAY 'Hello, I am Cobolator!'
    DISPLAY 'Command line args: ' WS-COMMAND-LINE
    CALL "PARSECONFIG" USING WS-COMMAND-LINE 

    STOP RUN.
    