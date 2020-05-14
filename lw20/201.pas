PROGRAM XPrintTest(INPUT, OUTPUT);
CONST
  Lines = 5;
  Columns = 5;
VAR
  Letter: CHAR;
PROCEDURE XPrint(VAR FOut: TEXT; Letter: CHAR);
VAR
  ElementNumber, Column, Line: INTEGER;
  MarkPlaces: SET OF 1..25 ;
BEGIN {XPrint}
  MarkPlaces := [];
  CASE Letter OF
    'Q' : MarkPlaces := [7, 8, 9, 12, 14, 17, 18, 19, 17, 18, 19, 25];
    'W' : MarkPlaces := [1, 5, 6, 10, 11, 15, 16, 18, 20, 22, 24];
    'E' : MarkPlaces := [2, 3, 4, 7, 12, 13, 14, 17, 22, 23, 24];
    'R' : MarkPlaces := [2, 3, 4, 7, 9, 12, 13, 14, 17, 18, 22, 24];
    'T' : MarkPlaces := [2, 3, 4, 8, 13, 18, 23];
    'Y' : MarkPlaces := [1, 5, 7, 9, 13, 18, 23];
    'U' : MarkPlaces := [1, 5, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'I' : MarkPlaces := [3, 8, 13, 18, 23];
    'O' : MarkPlaces := [2, 3, 4, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'P' : MarkPlaces := [2, 3, 4, 5, 7, 10, 12, 13, 14, 15, 17, 22]
  END;
  ElementNumber := 1;
  FOR Line := 1 TO Lines
  DO
  BEGIN
    FOR Column := 1 TO Columns
    DO
    BEGIN
      IF ElementNumber IN MarkPlaces
      THEN
        WRITE(FOut, 'X')
      ELSE
        WRITE(FOut, ' ');
      ElementNumber := ElementNumber + 1
    END;
    WRITELN
  END
END; {XPrint}
BEGIN {XPrintTest}
  READ(Letter);
  XPrint(OUTPUT, Letter)
END. {XPrintTest}
