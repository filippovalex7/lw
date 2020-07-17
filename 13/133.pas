PROGRAM Split(INPUT,OUTPUT);
  {Копирует INPUT в OUTPUT,сначала нечетные,а затем четные
   элементы}
VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;
PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);
BEGIN
  {Копируем F1 в OUTPUT}
  RESET(F1);
  WHILE NOT EOF(F1)
  DO
    BEGIN
      IF NOT EOLN(F1)
      THEN
        BEGIN
          READ(F1, Ch);
          WRITE(OUTPUT, Ch)
        END
      ELSE
        READLN(F1)
    END
END;

 
BEGIN
  {Разделяет INPUT в Odds и Evens}
  BEGIN
    ASSIGN(Odds, 'Odds.dat');
    ASSIGN(Evens, 'Evens.dat');
    REWRITE(Odds);
    REWRITE(Evens);
    Next := 'O';
    WHILE NOT EOF
    DO
      BEGIN
        WHILE NOT EOLN
        DO
          {Прочитать Ch, записать в файл, выбранный через
           Next,переключить Next}
           BEGIN
             READ(INPUT, Ch);		  
             IF Next = 'O'
             THEN
               BEGIN
                 WRITE(Odds, Ch);
                 Next := 'E'
               END
             ELSE
               BEGIN
                 WRITE(Evens, Ch);
                 Next := 'O'
               END
           END;
        READLN;
        WRITELN(Odds);
        WRITELN(Evens)
      END;
    WRITELN(Odds);
    WRITELN(Evens)
  END;
  CopyOut(Odds, Ch);
  WRITELN;
  CopyOut(Evens, Ch);
  WRITELN
END.

