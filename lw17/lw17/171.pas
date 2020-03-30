PROGRAM ReadDigitTest(INPUT, OUTPUT);
VAR 
  Dig, Sum: INTEGER;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR 
  Ch: CHAR;
  Fdig: TEXT;
BEGIN{ReadDigit}
  REWRITE(Fdig);
  IF (NOT EOLN(F))
  THEN
    BEGIN
      READ(F, Ch);
      IF (Ch = '1') OR (Ch = '2') OR (Ch = '3') OR (Ch = '4') OR (Ch = '5') 
        OR (Ch = '6') OR (Ch = '7') OR (Ch = '8') OR (Ch = '9')
      THEN
        BEGIN
          WRITELN(Fdig, Ch);
          RESET(Fdig);
          READ(Fdig, D)
        END
      ELSE
        D := -1
    END
  ELSE
    D := -1    
END;{ReadDigit}

BEGIN{ReadDigitTest}
  SuM := 0;
  Dig := 1;
  WHILE (Dig > -1)
  DO
    BEGIN
      ReadDigit(INPUT, Dig);
      IF (Dig > -1)
      THEN
        Sum := Sum + Dig
    END;
  WRITELN(Sum: 1)
END.{ReadDigitTest}
