PROGRAM ReadDigitTest(INPUT, OUTPUT);
VAR 
  CurrentDigit, Sum: INTEGER;
PROCEDURE ReadDigit(VAR InputFile: TEXT; VAR Digit: INTEGER);
VAR 
  Ch: CHAR;
BEGIN{ReadDigit}
  Digit := -1;
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
    END
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
