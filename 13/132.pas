PROGRAM LexicoTest(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;
  Result: CHAR;
PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
{Result 0, 1, 2 ���� ������������������ ������� F1 =, <, > ��� F2       
��������������. ����������� ���������, ��������������� F1 � F2,
������ ���� ����������}
VAR
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  RESET(F1);
  RESET(F2);
  Result := '0';
  WHILE (NOT EOLN(F1) AND NOT EOLN(F2)) AND (Result = '0')
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF EOLN(F1) AND EOLN(F2)
      THEN
        Result := '0'
      ELSE
        IF (Ch1 < Ch2) OR (EOLN (F1))
        THEN {Ch1 < Ch2 ��� F1 ������ F2}
          Result := '1'
        ELSE
          IF (Ch1 > Ch2) OR (EOLN (F2))
          THEN {Ch1 > Ch2 ��� F2 ������ F1}
            Result := '2'
    END
END; {Lexico}

BEGIN {LexicoTest}
  ASSIGN(F1,'F1.txt'); 
  ASSIGN(F2,'F2.txt'); 
  Lexico(F1, F2, Result);
  WRITELN(Result)
END. {LexicoTest}

