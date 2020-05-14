PROGRAM Number(INPUT, OUTPUT);
VAR
  Num: INTEGER;
PROCEDURE ReadDigit(VAR InputFile: TEXT; VAR Digit: INTEGER);
VAR 
  Ch: CHAR;
BEGIN{ReadDigit}
  IF (NOT EOLN(InputFile))
  THEN
    BEGIN
      READ(InputFile, Ch);
      IF Ch = '0' THEN Digit := 0 ELSE
      IF Ch = '1' THEN Digit := 1 ELSE
      IF Ch = '2' THEN Digit := 2 ELSE
      IF Ch = '3' THEN Digit := 3 ELSE                    
      IF Ch = '4' THEN Digit := 4 ELSE                                  
      IF Ch = '5' THEN Digit := 5 ELSE
      IF Ch = '6' THEN Digit := 6 ELSE
      IF Ch = '7' THEN Digit := 7 ELSE
      IF Ch = '8' THEN Digit := 8 ELSE
      IF Ch = '9' THEN Digit := 9
      ELSE
        Digit := -1 
    END  
  ELSE
    Digit := -1
END;{ReadDigit}
PROCEDURE ReadNumber(VAR InputFile: TEXT; VAR Number: INTEGER);
VAR 
  Total: INTEGER;
BEGIN{ReadNumber}
  Total := 0;
  Number := 0;
  WHILE (Total > -1) AND NOT EOLN(InputFile) AND (Number > -1)
  DO
    BEGIN
      ReadDigit(InputFile, Number);
      IF (Number > -1)
      THEN
        IF (Total < MAXINT DIV 10 - Number) AND (Number > -1)
        THEN
          BEGIN
            Total := Total * 10 + Number;
            READ(InputFile);
          END
        ELSE
          Total := -1;
    END;
  Number := Total
END;{ReadNumber}
BEGIN{Number}
  ReadNumber(INPUT, Num);
  WRITELN(Num: 1)
END.{Number}

