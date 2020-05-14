PROGRAM Prime(INPUT, OUTPUT);

CONST
  Min = 2;
  Max = 100;
VAR
  Sieve: SET OF Min..Max;
  PrimeDigit, CurrentDigit: INTEGER;
BEGIN{Prime}
  Sieve := [Min .. Max];
  PrimeDigit := Min;
  CurrentDigit := Min;
  WHILE Sieve <> [] 
  DO
    BEGIN
      WHILE CurrentDigit  <= Max
      DO
        BEGIN
          Sieve := Sieve - [CurrentDigit];
          CurrentDigit := CurrentDigit + PrimeDigit
        END;       
      WRITE(PrimeDigit, ' '); 
      WHILE NOT(PrimeDigit IN Sieve) AND (PrimeDigit < Max)
      DO
        BEGIN
          PrimeDigit := PrimeDigit + 1;
          CurrentDigit := PrimeDigit
        END
    END;
  WRITELN
END.{Prime}
