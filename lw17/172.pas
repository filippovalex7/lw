PROGRAM Number(INPUT, OUTPUT);
VAR
  Num: INTEGER;
PROCEDURE ReadDigit(VAR Finput: TEXT; VAR Digit: INTEGER);
VAR 
  Ch: CHAR;
  Fdigit: TEXT;
BEGIN{ReadDigit}
  REWRITE(Fdigit);
  IF (NOT EOLN(Finput))
  THEN
    BEGIN
      READ(Finput, Ch);
      IF (Ch >= '0') AND (Ch <= '9')
      THEN
        BEGIN
          WRITELN(Fdigit, Ch);
          RESET(Fdigit);
          READ(Fdigit, Digit)
        END
      ELSE
        Digit := -1
    END
  ELSE
    Digit := -1    
END;{ReadDigit}
PROCEDURE ReadNumber(VAR Finput: TEXT; VAR Number: INTEGER);
VAR 
  Total: INTEGER;
BEGIN{ReadNumber}
  Total := 0;
  Number := 0;
  WHILE (Total > -1) AND NOT EOLN(Finput) AND (Number > -1)
  DO
    BEGIN
      ReadDigit(Finput, Number);
      IF (Number > -1)
      THEN
        IF (Total < MAXINT DIV 10 - Number) AND (Number > -1)
        THEN
          BEGIN
            Total := Total * 10 + Number;
            READ(Finput);
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

