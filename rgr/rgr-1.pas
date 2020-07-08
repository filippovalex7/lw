PROGRAM Statistic(INPUT, OUTPUT);
USES
  FileModule, TreeModule;

  PROCEDURE GetSratistic(VAR FileIn: TEXT; VAR FileOut: TEXT);
  VAR
    Data: Tree;
    Word: STRING;
    Found: BOOLEAN;  
  BEGIN{GetSratistic}
    Data := NIL;
    WHILE NOT EOF(FileIn)
    DO
      BEGIN
        WHILE NOT EOLN(FileIn)
        DO
          BEGIN
            GetWord(FileIn, Word, Found);
            IF Found
            THEN
              InsertWord(Data, Word)
          END;
        READLN(FileIn)
      END;
    WriteInFile(FileOut, Data);
    ClearTree(Data)
  END;{GetSratistic} 

BEGIN{Statistic}
  ASSIGN(INPUT,'Input.txt'); 
  RESET(INPUT);
  ASSIGN(OUTPUT,'Output.txt'); 
  REWRITE(OUTPUT);
  GetSratistic(INPUT, OUTPUT)
END.{Statistic}
