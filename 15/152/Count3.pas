UNIT Count3;
INTERFACE
VAR
  Ones, Tens, Hundreds: CHAR;
  PROCEDURE Start;
  PROCEDURE Bump;
  PROCEDURE Value (VAR V100, V10, V1: CHAR);
IMPLEMENTATION
  PROCEDURE Start;
    {Ñáðàñûâàåò ñ÷åò÷èê â íîëü}
    BEGIN{Start}
      Ones := '0';
      Tens := '0';
      Hundreds := '0'
    END;{Start}
 
  PROCEDURE Bump;
    {Óâåëè÷èâàåò 3-öèôðîâîé ñ÷åò÷èê îïðåäåëåííûé   Ones, Tens, Hundreds
     íà åäèíèöó ,åñëè îí íàõîäèòñÿ â äèàïaçîíå îò 0 äî 999 }
    PROCEDURE NextDigit(VAR Digit: CHAR);
      BEGIN {NextDigit}
        IF Digit = '0' THEN Digit := '1' ELSE
        IF Digit = '1' THEN Digit := '2' ELSE
        IF Digit = '2' THEN Digit := '3' ELSE
        IF Digit = '3' THEN Digit := '4' ELSE
        IF Digit = '4' THEN Digit := '5' ELSE
        IF Digit = '5' THEN Digit := '6' ELSE
        IF Digit = '6' THEN Digit := '7' ELSE
        IF Digit = '7' THEN Digit := '8' ELSE
        IF Digit = '8' THEN Digit := '9' ELSE
        IF Digit = '9' THEN Digit := '0' ELSE
        WRITELN('NO DIGIT')
      END;{NextDigit}
    BEGIN {Bump}
      NextDigit( Ones );
      IF  Ones = '0'
      THEN
        BEGIN
          NextDigit(Tens);
          IF Tens= '0'
          THEN
            BEGIN
              NextDigit(Hundreds);
              IF Hundreds = '0'
              THEN
                BEGIN
                  Ones := '9';
                  Tens := '9';
                  Hundreds := '9'
                END
            END
        END
    END; {Bump}
    PROCEDURE Value (VAR V100, V10, V1: CHAR);
      {Âîçâðàùàåò ñîäåðæèìîå ñ÷åò÷èêà}
      BEGIN {Value}
         V100 := Hundreds;
         V10 := Tens;
         V1 := Ones
      END {Value};
BEGIN {Count3}
END. {Count3}

