PROGRAM ReverseCount(INPUT, OUTPUT);
USES 
  Count3;
VAR 
  V100, V10, V1, Ch1, Ch2, Ch3: CHAR;
BEGIN {ReverseCount}
  Start;
  IF NOT EOLN
  THEN
    BEGIN
      READ(Ch1);
      IF NOT EOLN
        THEN
          BEGIN
            READ(Ch2);
            IF NOT EOLN
            THEN
              READ(Ch3)
            ELSE
              WRITELN('Too few symbols')
          END    
        ELSE
          WRITELN('Too few symbols')
    END
  ELSE
    WRITELN('Too few symbols');
  WHILE NOT EOLN
  DO
    BEGIN
      IF ((Ch2 < Ch1) AND (Ch2 < Ch3)) OR ((Ch2 > Ch1) AND (Ch2 > Ch3))
      THEN
        Bump;
      Ch1 := Ch2;
      Ch2 := Ch3;
      READ(Ch3)
    END;
  IF ((Ch2 < Ch1) AND (Ch2 < Ch3)) OR ((Ch2 > Ch1) AND (Ch2 > Ch3))//Проверка последней тройки символов
  THEN
    Bump;
  Value(V100, V10, V1);
  WRITELN(V100, V10, V1);
END. {ReverseCount}
