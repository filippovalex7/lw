PROGRAM ReadDigitTest(INPUT, OUTPUT);
VAR 
  CurrentDigit, Sum: INTEGER;
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

BEGIN{ReadDigitTest}
  Sum := 0;
  CurrentDigit := 1;
  WHILE (CurrentDigit > -1)
  DO
    BEGIN
      ReadDigit(INPUT, CurrentDigit);
      IF (Currentdigit> -1)
      THEN
        Sum := Sum + CurrentDigit
    END;
  WRITELN(Sum: 1)
END.{ReadDigitTest}
