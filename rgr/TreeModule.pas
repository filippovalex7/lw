UNIT TreeModule;

INTERFACE
  TYPE
    Tree = ^Node;
    Node = RECORD
             Word: STRING;
             WordCount: INTEGER;
             LLink, RLink: Tree
           END;
  PROCEDURE InsertWord(VAR Ptr: Tree; Word: STRING);
  PROCEDURE ClearTree(VAR Ptr: Tree);
  PROCEDURE WriteInFile(VAR FileOut: TEXT; Ptr: Tree);

IMPLEMENTATION

  PROCEDURE InsertWord(VAR Ptr: Tree; VAR Word: STRING);
  BEGIN {IsertWord}
    IF Ptr = NIL
    THEN
      BEGIN 
        NEW(Ptr); 
        Ptr^.Word := Word;
        Ptr^.WordCount := 1;
        Ptr^.LLink := NIL;
        Ptr^.RLink := NIL
      END
    ELSE
      IF Word < Ptr^.Word
      THEN
        InsertWord(Ptr^.LLink, Word)
      ELSE
        IF Word > Ptr^.Word
        THEN
          InsertWord(Ptr^.RLink, Word) 
        ELSE
          Ptr^.WordCount := Ptr^.WordCount + 1                           
  END; {IsertWord}

  PROCEDURE WriteInFile(VAR FileOut: TEXT; Ptr: Tree);
  BEGIN{WriteInFile}
    IF Ptr <> NIL
    THEN
      BEGIN
        WriteInFile(FileOut, Ptr^.LLink);
        WRITELN(FileOut, Ptr^.Word, ' ', Ptr^.WordCount);
        WriteInFile(FileOut, Ptr^.RLink)
      END;
  END; {WriteInFile}

  PROCEDURE ClearTree(VAR Ptr: Tree);
  BEGIN{CleanTree}
    IF Ptr^.LLink <> NIL
    THEN
      ClearTree(Ptr^.LLink);
    IF Ptr^.RLink <> NIL
    THEN
      ClearTree(Ptr^.RLink);
    DISPOSE(Ptr)
  END; {CleanTree}

BEGIN
END.
