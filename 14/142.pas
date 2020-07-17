PROGRAM RCopyRun(INPUT, OUTPUT);

PROCEDURE RCopy (VAR FileIn: TEXT);
VAR
  Ch: CHAR;
BEGIN {RCopy}
  IF NOT EOLN(FileIn)
  THEN
    BEGIN
      READ(FileIn, Ch);
      WRITE(Ch);
      RCopy (FileIn)
    END
END; {RCopy}

BEGIN {RCopyRun}
  RCopy(INPUT)
END. {RCopyRun}
