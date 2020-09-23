Program Word;
  Var
    Ch:Char;
    F, Curr, FOut: text;              { исходный файл }
    Str:    string;    
    B,StrLenKnown: boolean;
    Int,Len,i:integer;
  Procedure Soob(Mess: string);
    Begin
      WriteLn(Mess);
      ReadLn;   { пауза }
      Halt      { конец программы }
    End;
  Procedure Copy (Var F1, F2: text);
  Var Ch: char;
  Begin {Copy}
    While Not Eof (F1)
    Do
      Begin
        If eoln(F1) Then Writeln(F2);
        Read(F1,Ch);
        Write(F2,Ch)
      End
  End; {Copy}
  Function IsFileName(var F:text; var str:string):boolean;
  Var Ch1,Ch2,Ch3,Ch4:Char;
  Begin
    IsFileName:=FALSE;
    Ch1:=' ';
    While Ch1 = ' '
    Do
      Begin
        Read(F,Ch1);
      End;
    If eoln(F)
    Then
      Readln(F);
    Read(F,Ch2,Ch3,Ch4);
    Str:=Str+Ch1+Ch2+Ch3+Ch4;
    While not eoln(F)
    Do
      Begin
        Ch1:=Ch2;Ch2:=Ch3;Ch3:=Ch4;Read(F,Ch4);Str:=Str+Ch4;      
      End; 
    If Ch1='.' Then if Ch2='t' Then if Ch3='x' Then if Ch4='t' Then IsFileName:=TRUE;    
  End;    
  Begin  { основная программа }
    if ParamCount<2 then Soob('Не указаны исходный и файл вывода')
      { в командной строке нет параметров }
    else Assign(F, ParamStr(1));
    Str:=ParamStr(1);
    {$I-}     { отключение прерывания при ошибке ввода }
    Reset(F);
    {$I+}     { восстановление системной реакции на ошибку }
    If IoResult<>0 then Soob('Ошибка открытия файла '+Str);
    Assign(FOut, ParamStr(2));
    Rewrite(FOut);
    Int:=0;
    Str:='';
    StrLenKnown:=FALSE;
    While not StrLenKnown
    Do
      Begin
        If IsFileName(F,Str)
        Then
          Begin
            Assign(Curr, Str); 
            Reset(Curr);
            While not eoln(Curr)
            Do
              Begin
                Read(Curr, Ch);
                Len:=Len+1
              End;
            StrLenKnown:=TRUE;
          End
        Else
          Readln(F);
      End;
    Reset(F);
    While not eof(F)
    Do
      Begin
        If IsFileName(F,Str)=FALSE 
        Then
          Begin
            If Int<1
            Then
              Begin
                For i:=1 to ((Len-Length(Str))div 2)   do Write(Fout, ' ');
                Writeln(FOut,Str);
              End;
            Int:=Int+1;
          End;
        Str:='';
        Readln(F)
      End;
    If Int<>1
    Then
      Writeln('Обнаружено ',Int,' заголовков. Введите заголовок в одну строку или добавьте его при отсутствии.');
    Reset(F);
    While not eof(F)
    Do
      Begin
        If IsFileName(F, Str)
        Then
          Begin
            Assign(Curr, Str);
            {$I-} 
            Reset(Curr);
           {$I+}   
            If IoResult<>0 then Soob('Ошибка открытия файла '+Str) 
            else Begin  Copy(Curr, FOut); Close(Curr) End
          End;
        Str:='';
        Readln(F)
      End; 
    Close(F);
    Close(FOut)         
  End.
