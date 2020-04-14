PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  FName: TEXT;
  Ch: CHAR;
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
BEGIN{AverageScore}
  ClassTotal := 0;
  WRITELN('Student scores:');
  Student := 1;
  WHILE Student <= ClassSize
  DO 
    BEGIN
      WRITE('Student''s name:');
      REWRITE(FName);
      IF NOT EOLN
      THEN
        BEGIN
          READ(INPUT, Ch);
          IF (Ch >= 'A') AND (Ch <= 'z')
          THEN
            WRITE(FName, Ch)
          ELSE
            WRITELN('Name must contain only letters')
        END
      ELSE
        WRITELN('Write student''s name');
      WHILE (Ch >= 'A') AND (Ch <= 'z') AND (NOT EOLN(INPUT))
      DO
        BEGIN
          READ(INPUT, Ch);
          WRITE(FName, Ch)
        END;
      WRITELN(FName);
      TotalScore := 0;
      WhichScore := 1;
      WHILE WhichScore <= NumberOfScores
      DO
        BEGIN
          READ(NextScore);
          IF (NextScore >= 0) AND (NextScore <=100)
          THEN
            BEGIN
              TotalScore := TotalScore + NextScore;
              WhichScore := WhichScore + 1
            END
          ELSE
            WRITELN('Incorrect data: score mmust be betwen 0 and 100')
        END;
      READLN;
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      WRITE('Average: ');
      RESET(FName);
      WHILE NOT EOLN(FName)
      DO
        BEGIN
          READ(FName, Ch);
          WRITE(OUTPUT, Ch)
        END;
      WRITE(' ');
      IF Ave MOD 10 >= 5
      THEN
        WRITE(Ave DIV 10 + 1)
      ELSE
        WRITE(Ave DIV 10);
      WRITELN;
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1;
    END;
  WRITELN;
  WRITELN ('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.{AverageScore}    

