PROGRAM SortMonth(INPUT, OUTPUT);
USES
  DateIO;
VAR
  Mo1, Mo2: Month;
BEGIN {SortMonth}
  WRITE('¬ведите два мес€ца: ');
  ReadMonth(INPUT, Mo1);
  ReadMonth(INPUT, Mo2);
  IF (Mo1 <> NoMonth) AND (Mo2 <> NoMonth)
  THEN  
    BEGIN
      IF Mo1 < Mo2
      THEN
        BEGIN
          WriteMonth(OUTPUT, Mo1);
          WRITE(' предшествует ');
          WriteMonth(OUTPUT, Mo2);
        END;
      IF Mo1 > Mo2
      THEN
        BEGIN
          WriteMonth(OUTPUT, Mo1);
          WRITE(' следует за ');
          WriteMonth(OUTPUT, Mo2);
        END;
      IF Mo1 = Mo2
      THEN
        BEGIN
          WRITE('ќба мес€ца ');
          WriteMonth(OUTPUT, Mo1);
        END
    END
  ELSE
    WRITELN('¬ходные данные записаны неверно')
END. {SortMonth}
