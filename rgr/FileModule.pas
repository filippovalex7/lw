UNIT FileModule;
INTERFACE
CONST
  Letters: SET OF CHAR = ['A' .. 'Z', 'a' .. 'z', 'À' .. 'ß', 'à' .. 'ÿ', '¨', '¸'];
  UpperCase: SET OF CHAR = ['A' .. 'Z', 'À' .. 'ß'];
  LowerConst = 32;
  
  FUNCTION ToLowerCase(Letter: CHAR): CHAR;
  PROCEDURE GetWord(VAR FileIn: TEXT; VAR Word: STRING; VAR Found: BOOLEAN);
     
IMPLEMENTATION

  FUNCTION ToLowerCase(Letter: CHAR): CHAR;
  BEGIN{ToLowerCase}       
    IF Letter IN UpperCase
    THEN
      ToLowerCase := CHR(ORD(Letter) + LowerConst)
    ELSE
      IF Letter IN ['¨', '¸'] 
      THEN
        ToLowerCase := 'å'
      ELSE
        ToLowerCase := Letter
  END;{ToLowerCase}
  
  PROCEDURE GetWord(VAR FileIn: TEXT; VAR Word: STRING; VAR Found: BOOLEAN);
  VAR
    Ch: CHAR;
  BEGIN{GetWord}
    Word := '';
    Found := FALSE;
    WHILE (NOT Found) AND (NOT EOLN(FileIn))
    DO
      BEGIN
        READ(FileIn, Ch);
        IF (Ch IN Letters)
        THEN
          Found := TRUE
      END;
    IF Found
    THEN
      BEGIN
        WHILE (NOT EOLN(FileIn)) AND (Ch IN Letters)
        DO
          BEGIN
            Word := Word + ToLowerCase(Ch);
            READ(FileIn, Ch)            
          END;
        IF (Ch IN Letters)
        THEN 
          Word := Word + ToLowerCase(Ch)
      END            
  END;{GetWord}
 
BEGIN
END.
