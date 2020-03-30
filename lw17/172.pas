PROGRAM Number(INPUT, OUTPUT);
VAR
  Num: INTEGER;
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
PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
VAR 
  Fnum: TEXT;
  Sum: INTEGER;
BEGIN{ReadNumber}
  Sum := 0;
  N := 0;
  WHILE (Sum > -1) AND NOT EOLN(F) AND (N > -1)
  DO
    BEGIN
      ReadDigit(F, N);
      IF (N > -1)
      THEN
        IF (Sum < MAXINT DIV 10 - N) AND (N > -1)
        THEN
          BEGIN
            Sum := Sum * 10 + N;
            READ(F);
          END
        ELSE
          Sum := -1;
    END;
  N := Sum
END;{ReadNumber}
BEGIN{Number}
  ReadNumber(INPUT, Num);
  WRITELN(Num: 1)
END.{Number}

