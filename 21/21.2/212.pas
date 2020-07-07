PROGRAM Encryption(INPUT, OUTPUT);
CONST
  MaxLen = 20;
TYPE
  Str = ARRAY [1 .. MaxLen] OF 'A' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  LenStr: 0 .. MaxLen;
  ChiperFile, EncryptedMsg: TEXT;

PROCEDURE Initialize(VAR FInChiper: TEXT);
VAR
  Letter, ChiperLetter: CHAR;
  I: CHAR;
BEGIN {Initialize}
  FOR I := ' ' TO 'Z'
  DO
    Code[I] := I;
  RESET(FInChiper);
  WHILE NOT EOF(FInChiper)
  DO
    BEGIN
      WHILE NOT EOLN(FInChiper)
      DO
        BEGIN
          READ(FInChiper, Letter);
          IF NOT EOLN(FInChiper)
          THEN
            READ(FInChiper, ChiperLetter);
          IF NOT EOLN(FInChiper)
          THEN
            READ(FInChiper, ChiperLetter);
          IF Letter IN [' ' .. 'Z']
          THEN
            Code[Letter] := ChiperLetter
        END;
      READLN(FInChiper)
    END
END;  {Initialize}

PROCEDURE Encode(VAR MsgStr: Str; LenStr: INTEGER);
VAR
  Index: 1 .. MaxLen;
BEGIN {Encode}
  FOR Index := 1 TO LenStr
  DO
    IF MsgStr[Index] IN [' ' .. 'Z']
    THEN
      WRITE(OUTPUT, Code[MsgStr[Index]])
    ELSE
      BEGIN
        WRITE(OUTPUT, MsgStr[Index]);
        WRITE(EncryptedMsg, MsgStr[Index])
      END;
  WRITELN(EncryptedMsg);
  WRITELN
END;  {Encode}

BEGIN {Encryption}
  ASSIGN(ChiperFile, 'Chiper.TXT');
  Initialize(ChiperFile);
  REWRITE(EncryptedMsg);
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      LenStr := 0;
      WHILE NOT EOLN(INPUT) AND (LenStr < MaxLen)
      DO
        BEGIN
          LenStr := LenStr + 1;
          READ(INPUT, Msg[LenStr])
        END;
      Encode(Msg, LenStr);
      READLN;
      WRITELN
    END
END.  {Encryption}
