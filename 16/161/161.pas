PROGRAM SortMonth(INPUT, OUTPUT);
USES
  DateIO;
VAR
  Mo1, Mo2: Month;
BEGIN {SortMonth}
  WRITE('������� ��� ������: ');
  ReadMonth(INPUT, Mo1);
  ReadMonth(INPUT, Mo2);
  IF (Mo1 <> NoMonth) AND (Mo2 <> NoMonth)
  THEN  
    BEGIN
      IF Mo1 < Mo2
      THEN
        BEGIN
          WriteMonth(OUTPUT, Mo1);
          WRITE(' ������������ ');
          WriteMonth(OUTPUT, Mo2);
        END;
      IF Mo1 > Mo2
      THEN
        BEGIN
          WriteMonth(OUTPUT, Mo1);
          WRITE(' ������� �� ');
          WriteMonth(OUTPUT, Mo2);
        END;
      IF Mo1 = Mo2
      THEN
        BEGIN
          WRITE('��� ������ ');
          WriteMonth(OUTPUT, Mo1);
        END
    END
  ELSE
    WRITELN('������� ������ �������� �������')
END. {SortMonth}
